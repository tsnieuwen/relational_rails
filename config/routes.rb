Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'
  get '/teams', to: 'team#index'
  get 'teams/new', to: 'team#new'
  post '/teams', to: 'team#create'
end