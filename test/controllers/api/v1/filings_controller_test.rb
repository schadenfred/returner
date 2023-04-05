require 'test_helper'

class Api::V1::FilingsControllerTest < ActionDispatch::IntegrationTest
  Given(:filing) { filings(:one) }

  describe '#index' do
    Given { get api_v1_filings_url }
    Then { assert_response 200 }
  end

  describe '#show' do
    Given { get api_v1_filing_url(id: filing.id), as: :json }
    Given(:json) { JSON.parse(response.body) }
    Then { assert_response 200 }
    And { assert_equal true, json['is_valid_to_irs?'] }
    And { assert_equal '2016', json['tax_year'] }
  end

  describe '#show' do
    Given { get api_v1_filer_filings_url(filer_id: filing.filer.id), as: :json }
    Given(:json) { JSON.parse(response.body) }
    focus
    Then { assert_response 200 }
    # And { assert_equal true, json['is_valid_to_irs?'] }
    # And { assert_equal '2016', json['tax_year'] }
  end
end
