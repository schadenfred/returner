Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :filings, format: :json
      resources :awards
      resources :filers, format: :json
      resources :orgs do
        resources :recieved
        resources :granted
        resources :recipients
        resources :granters
        resources :filings, format: :json
      end
    end
  end
  root 'pages#home'
end
