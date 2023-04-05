json.extract! filing, :id, :tax_period_end_date, :return_timestamp, :tax_year
json.is_valid_to_irs filing.is_valid_to_irs?.to_s
json.url api_v1_filing_url(filing, format: :json)
json.awards filing.awards do |award|
  json.partial! 'api/v1/awards/award', award:
end
