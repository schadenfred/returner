require 'test_helper'

describe AwardsFiling do
  context 'class' do
    context 'db' do
      context 'columns' do
        should have_db_column(:award_id)
        should have_db_column(:filing_id)
      end
    end

    context 'associations' do
      context 'belongs to' do
        should belong_to(:award)
        should belong_to(:filing)
      end
    end
  end
end
