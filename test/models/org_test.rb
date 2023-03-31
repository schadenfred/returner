require 'test_helper'

class OrgTest < ActiveSupport::TestCase
  context 'class' do
    context 'db' do
      context 'columns' do
        should have_db_column(:address)
        should have_db_column(:city)
        should have_db_column(:ein)
        should have_db_column(:line_1)
        should have_db_column(:name)
        should have_db_column(:state)
        should have_db_column(:zip)
      end
    end

    context 'associations' do
      context 'has many' do
        should have_many(:filings)
        should have_many(:granted)
        should have_many(:granters).through(:granted).class_name('Org')
        should have_many(:received)
        should have_many(:recipients).through(:received).class_name('Org')
      end
    end
  end
end
