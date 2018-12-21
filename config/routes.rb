Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root "static_pages#home"
  get "/contact",to: "static_pages#contact"
  # get "/home",   to: "static_pages#home"
  get "/help" ,to:"static_pages#help"
  get "/about" ,to: "static_pages#about"

  get "/signup" , to:"users#new"
  get "/users" ,to: "users#index"
  #get "/users/new", to:"users#new"
  get "/users/:id", to:"users#show"
  post "/users", to:"users#create"
  post "/signup", to:"users#create"
  get "/users/:id/edit" ,to: "users#edit"
  patch "/users/:id" ,to: "users#update"
  delete "/users/delete" , to: "users#destroy"

  get "/login" , to: "sessions#new"
  post "/login" , to: "sessions#create"
  delete "/logout" , to: "sessions#destroy"
resources :users
end
