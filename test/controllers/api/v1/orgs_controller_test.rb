require 'test_helper'

class Api::V1::OrgsControllerTest < ActionDispatch::IntegrationTest
  Given(:org) { orgs(:one) }

  describe '#index' do
    Given { get api_v1_orgs_url }
    Then { assert_response 200 }
  end

  describe '#show' do
    Given { get api_v1_org_url(id: org.id), as: :json }
    Given(:json) { JSON.parse(response.body) }
    Then { assert_response 200 }
    And { assert_equal 'United Way', json['name'] }
  end
end
