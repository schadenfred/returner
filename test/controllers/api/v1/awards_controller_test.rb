require 'test_helper'

class Api::V1::AwardsControllerTest < ActionDispatch::IntegrationTest
  Given(:award) { awards(:one) }

  describe '#index' do
    Given { get api_v1_awards_url, as: :json }
    Then { assert_response 200 }
  end

  describe '#should show award' do
    Given { get api_v1_award_url(id: award.id), as: :json }
    Then { assert_response 200 }
    # And { assert_equal 'United Way', json['name'] }
  end
end
