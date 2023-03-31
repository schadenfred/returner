require 'uri'
require 'net/http'
require 'nokogiri'
require 'byebug'

namespace 'db:ingest' do
  ## For a production app I'd separate this into a class and then call it from in here.

  desc 'Ingest returns'
  task :returns, [:url_id] => :environment do |_t, args|
    Org.delete_all

    path = 'https://filing-service.s3-us-west-2.amazonaws.com/990-xmls'
    url_ids = %w[
      201612429349300846
      201612429349300846
      201831309349303578
      201641949349301259
      201921719349301032
      202141799349300234
      201823309349300127
      202122439349100302
      201831359349101003
    ]

    (args[:url_id].nil? ? url_ids : [args[:url_id]]).each do |url_id|
      res = Net::HTTP.get_response(URI("#{path}/#{url_id}_public.xml"))
      doc = Nokogiri::XML res.body
      doc.remove_namespaces!
      ingest_filer(doc)
      ingest_filing(doc)
      ingest_awards(doc)
    end
  end

  private

  def ingest_filer(doc)
    filer = doc.xpath('//Filer')
    address = filer.xpath('//Filer//USAddress')

    @filer = ingest_org({ ein: filer.xpath('EIN'),
                          name: filer.xpath('BusinessName//BusinessNameLine1Txt'),
                          line_1: address.xpath('AddressLine1Txt'),
                          city: address.xpath('CityNm'),
                          zip: address.xpath('ZIPCd'),
                          state: address.xpath('StateAbbreviationCd') })
  end

  def ingest_filing(doc)
    return_timestamp = doc.xpath('//Return//ReturnHeader//ReturnTs').text
    tax_period_end_date = doc.xpath('//Return//ReturnHeader//TaxPeriodEndDt').text
    @filing = @filer
              .filings
              .where(return_timestamp: return_timestamp, tax_period_end_date: tax_period_end_date)
              .first_or_create
  end

  def ingest_recipient(doc)
    address = doc.xpath('USAddress')
    ingest_org({
                 ein: doc.xpath('RecipientEIN'),
                 name: doc.xpath('RecipientBusinessName//BusinessNameLine1Txt'),
                 line_1: address.xpath('AddressLine1Txt'),
                 city: address.xpath('CityNm'),
                 zip: address.xpath('ZIPCd'),
                 state: address.xpath('StateAbbreviationCd')
               })
  end

  def ingest_awards(doc)
    awards = doc.xpath('//Return/ReturnData/IRS990ScheduleI/RecipientTable')

    awards.each do |award|
      amount = award.xpath('CashGrantAmt').text
      purpose = award.xpath('PurposeOfGrantTxt').text
      recipient = ingest_recipient(award)
      @filing.awards.where(
        granter: @filer, recipient: recipient, amount: amount, purpose: purpose
      ).first_or_create
    end
  end

  def ingest_org(attrs = {})
    attrs.transform_values! { |element| element.text }
         .merge!({ address: [
           attrs[:line_1],
           "#{attrs[:city]}, #{attrs[:state]}  #{attrs[:zip]}"
         ].join('/n') })

    org = Org.where(attrs.slice!(:ein, :name)).first_or_create
    org.update(attrs)
    org
  end
end
