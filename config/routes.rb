Chuckblog::Application.routes.draw do
  
  # themes
  themes_for_rails

  # 管理用户
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' },
    :controllers => { :sessions => "users/sessions" }
  
  # 首页
  root :to => 'home#index'
  
  # 后台
  namespace :admin do 
    root :to => 'home#index'   
    resources :settings, :post_files
    resources :categories do |c|
      collection do
        post :search
        delete :destroy_selected
      end
    end
    resources :posts do |p|
      collection do
        post :search
        delete :destroy_selected
      end
    end
  end
  
  # Blog routes
  namespace :blog do
    root :to => "posts#index"
    resources :posts, :only => [:index]
    match "/:year/:month/:day/:id-:slug" => "posts#show", :as => :post, 
      :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/, :slug => /[a-z0-9\-]+/ }  
  end
  
  resources :comments, :only => [:create, :destroy]
  resources :tags, :only => [:index]
  match "/tag/:name" => "tags#show", :as => :tag
  match "/category/:alias" => "categories#show", :as => :category
end
