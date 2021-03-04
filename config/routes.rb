Rails.application.routes.draw do
  namespace :api do
     namespace :v1 do
      #/api/v1/users
      resources :users do
        #/api/v1/users/:id/facts
        resources :facts
      end
      #/api/v1/
      post "/login", to: "users#login"
      get "/auto-login", to: "users#auto_login"
      #/api/v1/posts
       resources :posts do
      end
     end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
