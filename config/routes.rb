Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :verticals do
        resources :categories do
          resources :courses
        end
      end
    end
  end
end
