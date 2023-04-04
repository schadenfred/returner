json.extract! org, :id, :ein, :name, :address
json.url api_v1_org_url(org, format: :json)

json.filings org.filings do |filing|
  json.partial! 'api/v1/filings/filing', filing:
end

# json.array! org.filings, partial: 'api/v1/filings/filing', as: :filing
# json.filings org.filings do |filing|
#   # json.extract! filing, :return_timestamp
#   # json.filing api_v1_filing_url(filing, format: :json)
#   # json.return_timestamp filing.return_timestamp
#   json.array!
#   # json.tax_period_end_date filing.tax_period_end_date
# end
