Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'
  get '/teams', to: 'team#index'
  get 'teams/new', to: 'team#new'
  post '/teams', to: 'team#create'
  get '/teams/:id', to: 'team#show'
  get '/teams/:id/edit', to: 'team#edit'
  patch '/teams/:id', to: 'team#update'
  delete '/teams/:id', to: 'team#destroy'
  get '/athletes', to: 'athlete#index'
  get '/athletes/:id', to: 'athlete#show'
  get '/teams/:id/athletes', to: 'team#show_athletes'
  get '/teams/:id/athletes/new', to: 'athlete#new'
  post '/athletes', to: 'athlete#create'
  get '/athletes/:id/edit', to: 'athlete#edit'
  get '/athletes/:id/edit', to: 'athlete#edit'
  patch '/athletes/:id', to: 'athlete#update'
  delete '/athletes/:id', to: 'athlete#destroy'

end
