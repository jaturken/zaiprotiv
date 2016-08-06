Rails.application.routes.draw do
  resources :arguments
  namespace :api do
    namespace :v1 do
      resources :subjects do
        resources :arguments
      end
    end
  end

  resources :subjects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
