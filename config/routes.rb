Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :awards, format: :json
      resources :filers, format: :json
      resources :orgs, format: :json do
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
