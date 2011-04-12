Chuckblog::Application.routes.draw do
  
  # themes
  # themes_for_rails

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
  
  # index page
  root :to => "blog/posts#index"
  
  # Blog routes
  scope :module => "blog" do
    resources :posts, :path => "blog", :only => [:index, :show]
  end
  
  resources :comments, :only => [:create, :destroy]
  resources :tags, :only => [:index]
  match "/tag/:name" => "tags#show", :as => :tag
  match "/category/:alias" => "categories#show", :as => :category
end
