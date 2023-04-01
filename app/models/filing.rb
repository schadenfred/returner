class Filing < ApplicationRecord
  belongs_to :filer, class_name: 'Org', foreign_key: :filer_id

  has_many :awards_filings
  has_many :awards, through: :awards_filings
  has_many :recipients, through: :awards

  validates :filer, :return_timestamp, :tax_period_end_date, presence: true
  validates :return_timestamp, uniqueness: true

  include ActionView::Helpers::NumberHelper

  def is_valid_to_irs?
    return_timestamp.eql?(filer.filings.pluck(:return_timestamp).sort.last)
  end

  def tax_year
    tax_period_end_date.split('-').first
  end

  def description
    array = [].tap do |a|
      a << "#{filer.name}'s #{tax_year} filing declares they gave #{awards.count}"
      a << 'awards'.pluralize(awards.count, 'award').to_s
      a << "to #{recipients.count} #{'different recipients'.pluralize(recipients.count, 'recipient')}"
      a << "totaling #{awards.empty? ? 0 : number_to_currency(awards.pluck(:amount).sum)}."
    end
    array.join(' ')
  end
end
