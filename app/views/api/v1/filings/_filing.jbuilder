json.extract! filing, :id, :tax_period_end_date, :return_timestamp, :tax_year, :is_valid_to_irs?
json.url api_v1_filing_url(filing, format: :json)
