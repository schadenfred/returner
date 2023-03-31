require 'test_helper'

class AwardTest < ActiveSupport::TestCase
  context 'class' do
    context 'db' do
      context 'columns' do
        should have_db_column(:amount).of_type(:integer)
        should have_db_column(:granter_id).of_type(:integer)
        should have_db_column(:purpose)
        should have_db_column(:recipient_id).of_type(:integer)
        should have_db_column(:tax_period_end_date)
      end
    end

    context 'associations' do
      context 'belong to' do
        should belong_to(:granter).class_name('Org')
        should belong_to(:recipient).class_name('Org')
      end

      context 'has many' do
        should have_many(:filings).through(:awards_filings)
      end
    end
  end
end
