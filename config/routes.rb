Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'
  get '/teams', to: 'team#index'
  get 'teams/new', to: 'team#new'
  post '/teams', to: 'team#create'
  get '/teams/:id', to: 'team#show'
  get '/teams/:id/edit', to: 'team#edit'
  patch 'teams/:id', to: 'team#update'
end
