Chuckblog::Application.routes.draw do
  
  # themes
  # themes_for_rails

  root :to => 'blog/posts#index'
  
  # 管理用户
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' },
    :controllers => { :sessions => "users/sessions" }
  
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

  # 博客
  namespace :blog do
    root :to => 'posts#index'
    resources :posts, :path => '', :only => [:index]
    match '/:id-:slug' => 'posts#show', :as => :post, :constraints => { :id => /\d+/, :slug => /[a-zA-Z0-9\-]+/ }
    resources :tags, :only => [:index]
    match '/tag/:name' => 'tags#show', :as => :tag
    match '/category/:alias' => 'categories#show', :as => :category
  end
  
  # 相册
  namespace :photo do
    root :to => 'albums#index'
    resources :albums, :path => '', :only => [:index]
    match '/album/:name' => 'albums#show', :as => :album
    match '/:name' => 'images#show', :as => :image
  end
  
  # 评论
  resources :comments, :only => [:create, :destroy]
  
end
