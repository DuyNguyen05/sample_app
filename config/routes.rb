Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "static_pages#home"
  get "/static_pages/contact"
  get "/static_pages/home"
  get "/static_pages/help"
  get "/static_pages/about"

  get "/signup" , to:"users#new"
  #get "/users/new", to:"users#new"
  get "/users/:id", to:"users#show"
  post "/users", to:"users#create"
  post "/signup", to:"users#create"


resources :users
end
