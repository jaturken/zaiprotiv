Rails.application.routes.draw do
  devise_for :users

  namespace :v1 do
    resources :samples do
      resources :sample_arguments
    end

    resources :subjects do
      resources :arguments
    end
    get '/search/:text', to: 'searches#search', as: 'search'
    mount_devise_token_auth_for 'User', at: 'auth'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
