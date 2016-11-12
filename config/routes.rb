Rails.application.routes.draw do
  resources :sample_arguments
  resources :samples
  devise_for :users
  resources :arguments
  namespace :v1 do
    resources :subjects do
      resources :arguments
    end
    get '/search/:text', to: 'searches#search', as: 'search'
    mount_devise_token_auth_for 'User', at: 'auth'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
