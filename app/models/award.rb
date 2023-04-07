class Award < ApplicationRecord
  belongs_to :granter, foreign_key: :granter_id, class_name: 'Org'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'Org'

  has_many :awards_filings
  has_many :filings, through: :awards_filings

  validates :granter, :recipient, presence: true
end
