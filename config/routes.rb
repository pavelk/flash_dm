ActionController::Routing::Routes.draw do |map|
  #map.resources :puzzles

  
  map.resources :news
  map.resources :galleries, :collection => { :index_flash => :get  }, :member => { :create_flash => :post, :show_flash => :get, :add_rating => :post }
  map.resources :shoppings
  map.resources :products
  map.resources :friends
  map.resources :notes
  map.resources :ratings
  map.resources :travels, :member => { :add_photo => :post, :create_flash => :post, :show_flash => :get, :add_rating => :post }, :collection => { :index_flash => :get  }
  
  map.root :controller => 'home'
  map.connect 'most_rated_gallery', :controller => 'home', :action => 'most_rated_gallery'
  map.connect 'most_rated_trip', :controller => 'home', :action => 'most_rated_trip'
  map.connect 'planovac-kuchyne', :controller => 'home', :action => 'popup_1'
  map.connect 'planovac-detskeho-pokoje', :controller => 'home', :action => 'popup_2'
  map.resources :users, :member => { :update_status => :get }
  map.connect 'get_code', :controller => 'users', :action => 'get_code'  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.namespace :admin do |admin|
    admin.root :controller => "user_sessions", :action => "new"
    admin.logout '/logout', :controller => "user_sessions", :action => "destroy"
    admin.resource :user_session
    admin.resources :users
    admin.resources :travels, :as => 'vylety', :member => { :photos => :get }
    admin.resources :friends
    admin.resources :notes, :as => 'napiste-nam'
    admin.resources :galleries
  end
  
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
