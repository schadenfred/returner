json.extract! org, :id, :ein, :name, :address
json.url api_v1_org_url(org, format: :json)

json.filings org.filings do |filing|
  json.partial! 'api/v1/filings/filing', filing:
end
