Rails.application.routes.draw do
  namespace :api do
    resources :events, only: %i[index show create destroy update]

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

  root to: redirect('/events')

  get 'events', to: 'site#index'
  get 'events/new', to: 'site#index'
  get 'events/:id', to: 'site#index'
  get 'events/:id/edit', to: 'site#index'
end
