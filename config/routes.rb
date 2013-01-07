Classicrent::Application.routes.draw do

  devise_for :users

  resources :user, :controller => "user"

  resources :tenders

  resources :metros do
    collection do
      get 'by_metro'
    end
  end
  resources :metros

  resources :welcome_images

  resources :flats do
    collection do
      get 'by_street'
    end
  end

  resources :flats

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

  match '/order' => 'tenders#welcome'

  match '/feedback' => 'statics#feedback', :short_url => "feedback"
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
