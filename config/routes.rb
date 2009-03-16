ActionController::Routing::Routes.draw do |map|
  map.resources :news

  map.resources :galleries, :collection => { :index_flash => :get  }, :member => { :create_flash => :post, :show_flash => :get, :add_rating => :post }

  map.resources :shoppings

  map.resources :products

  map.resources :friends

  map.resources :notes

  map.resources :ratings

  map.resources :travels, :member => { :add_photo => :post, :create_flash => :post, :show_flash => :get, :add_rating => :post }, :collection => { :index_flash => :get  }
  
  map.root :controller => 'home'
  map.resources :users
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.namespace :admin do |admin|
    admin.root :controller => "user_sessions", :action => "new"
    admin.resource :user_session
    admin.resources :users
    admin.resources :travels
  end
end
