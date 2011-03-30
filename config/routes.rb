Chuckblog::Application.routes.draw do
  
  # themes
  themes_for_rails

  # 管理用户
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }
  
  # 首页
  root :to => 'posts#index'
  
  # 后台
  namespace :admin do 
    root :to => 'home#index'   
    resources :settings
    resources :post_files
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
  
  # posts
  # show post: /2011/03/22/1-description
  resources :posts, :except => :show
  resources :comments
  match "/:year/:month/:day/:id-:slug" => "posts#show", :as => :post, 
    :constraints => { :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/, :slug => /[a-z0-9\-]+/ }
end
