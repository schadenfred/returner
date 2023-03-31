require 'test_helper'

class FilingTest < ActiveSupport::TestCase
  context 'class' do
    context 'db' do
      context 'columns' do
        should have_db_column(:filer_id)
        should have_db_column(:return_timestamp)
        should have_db_column(:tax_period_end_date)
      end
    end

    context 'associations' do
      context 'belongs to' do
        should belong_to(:filer).class_name('Org').with_foreign_key(:filer_id)
      end

      context 'has many' do
        should have_many(:awards).through(:awards_filings)
        should have_many(:recipients).through(:awards)
      end
    end
  end

  describe '#is_currently_valid?' do
    Given(:filing_new) { filings(:one) }
    Given(:filing_old) { filings(:two) }

    Then { assert filing_new.is_valid_to_irs? }
    And { refute filing_old.is_valid_to_irs? }
  end

  describe '#description' do
    Given(:filing) { filings(:one) }
    Given(:filer) { orgs(:one) }
    Given(:award) { awards(:one) }
    Given(:recipient) { orgs(:two) }
    # Given(:award) { awards(:one) }

    Then do
      assert_match /United Way's/, filing.description
      assert_match /2016 filing/, filing.description
      assert_match /2 awards/, filing.description
      assert_match /2 different recipients/, filing.description
      assert_match /totaling \$3,000/, filing.description
    end
  end
end
