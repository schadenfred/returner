class Org < ApplicationRecord
  has_many :granted, class_name: 'Award', as: :granter, dependent: :destroy
  has_many :received, class_name: 'Award', as: :recipient, dependent: :destroy
  has_many :recipients, through: :received
  has_many :granters, through: :granted
  has_many :filings, inverse_of: :filer, foreign_key: :filer_id, dependent: :destroy

  validates :ein, uniqueness: {
    case_sensitive: false,
    scope: :name
  }

  scope :filers, -> { includes(:filings).select { |f| f.filings.count > 0 } }

  scope :awardeds, -> { includes(:received).select { |f| f.received.count > 0 } }

  scope :awarders, lambda {
                     includes(:filings)
                       .select { |f| f.filings.count > 0 }
                   }

  def address
    self['address'] || [
      line_1,
      "#{city}, #{state}  #{zip}"
    ].join('/n')
  end
end
