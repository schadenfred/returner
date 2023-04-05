require 'test_helper'

class Api::V1::FilersControllerTest < ActionDispatch::IntegrationTest
  Given(:filer) { orgs(:one) }

  describe '#index' do
    Given { get api_v1_filers_url }
    Then { assert_response 200 }
  end

  describe '#show' do
    Given { get api_v1_filer_url(id: filer.id), as: :json }
    Given(:json) { JSON.parse(response.body) }
    Then { assert_response 200 }
    And { assert_equal 'United Way', json['name'] }

    describe 'filer data' do
      # Then { assert_equal 'blah', json }
    end
  end
end
