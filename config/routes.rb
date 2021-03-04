Rails.application.routes.draw do
  namespace :api do
     namespace :v1 do
      resources :users do
        resources :facts
      end
      post "/login", to: "users#login"
      get "/auto-login", to: "users#auto_login"
       resources :posts do
      end
     end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
