Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'

  get '/teams', to: 'team#index'
  get 'teams/new', to: 'team#new'
  post '/teams', to: 'team#create'
  get '/teams/:id', to: 'team#show'
  get '/teams/:id/edit', to: 'team#edit'
  patch 'teams/:id', to: 'team#update'
  delete 'teams/:id', to: 'team#destroy'

  get '/resorts', to: 'resorts#index'
  get '/resorts/new', to: 'resorts#new'
  post '/resorts', to: 'resorts#create'
  get '/resorts/:id', to: 'resorts#show'
  get '/resorts/:id/customers', to: 'customers#show_by_resort'
  get '/resorts/:id/edit', to: 'resorts#edit'
  patch '/resorts/:id', to: 'resorts#update'
  delete '/resorts/:id', to: 'resorts#destroy'
  get '/customers', to: 'customers#index'
  get '/customers/:id', to: 'customers#show'
  get '/customers/:id/edit', to: 'customers#edit'
  patch '/customers/:id', to: 'customers#update'
  delete 'customers/:id', to: 'customers#destroy'
  get '/resorts/:id/customers/new', to: 'customers#new'
  post '/resorts/:id/customers', to: 'customers#create'
end
