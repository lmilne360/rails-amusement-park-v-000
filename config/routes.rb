Rails.application.routes.draw do

  root 'static#home'

resources :users
resources :attractions

get '/signin' => 'sessions#new'
post '/signin' => 'sessions#create'
delete '/signout' => 'sessions#destroy'

post '/rides/new' => 'rides#new', as: "new_ride"

end