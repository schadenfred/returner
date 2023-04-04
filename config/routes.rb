Rails.application.routes.draw do
  namespace :api do
    resources :events, only: %i[index show create destroy update]

    namespace :v1 do
      resources :filings, format: :json
      resources :awards
      resources :filers, format: :json do
        resources :filings, format: :json
      end
      resources :orgs do
        resources :recieved
        resources :granted
        resources :recipients
        resources :granters
        resources :filings, format: :json
      end
    end
  end

  root to: redirect('/filers')

  get 'filers', to: 'site#index'
  get 'events', to: 'site#index'
  get 'events/:id', to: 'site#index'
  get 'filers/:id', to: 'site#index'
end
