Rails.application.routes.draw do

	########### Static Pages ###########
  root 'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/contact', to: 'static_pages#contact'

  ########### Sessions ###############
	get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  ########### Users ##################
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'

  ########### Events #################
  get    '/host',    to: 'events#new'
  post   '/host',    to: 'events#create'

  ########### Invitations ############
  #resources :events do
  #  get    '/invite',  to: 'invitations#new'
  #  post   '/invite',  to: 'invitations#create'
  #  post   '/attend',  to: 'invitations#update'
  #end

  ########### Resources ##############
  resources :users
  resources :events
  
end
