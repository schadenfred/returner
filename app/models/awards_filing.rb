class AwardsFiling < ApplicationRecord
  belongs_to :award
  belongs_to :filing

  validates :award, :filing, presence: true
end
