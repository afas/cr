Classicrent::Application.routes.draw do

  resources :tenders

  resources :metros do
    collection do
      get 'by_metro'
    end
  end
  resources :metros

  resources :welcome_images

  resources :flats

  devise_for :users

  resources :flat_images

  resources :static_images

  resources :static_files

  resources :imports

  resources :search

  #match '/search' => 'search#results'
  #resources :search do
  #  collection do
  #    post 'go_search'
  #  end
  #end

  match '/special' => 'statics#special'

  resources :statics

  resources :statics do
    collection do
      get '/new/:menu' => 'statics#new'
    end
  end

  match '/:short_url' => 'statics#show'

  root :to => 'welcome#index'

end
