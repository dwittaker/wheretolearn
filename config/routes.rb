Wheretolearn::Application.routes.draw do



=begin
  get "users/index"

  get "users/edit"

  get "users/update"

  get "users/new"

  get "users/create"

  get "users/destroy"


  get "roles/index"

  get "roles/edit"

  get "roles/update"

  get "roles/new"

  get "roles/create"

  get "roles/destroy"

  get "role/index"

  get "role/edit"

  get "role/update"

  get "role/new"

  get "role/create"

  get "role/destroy"
=end


  get "search/search"

  resources :schedtypes


  resources :costtypes


#  devise_for :users
##====== this block added from Treebook project to replace the basic devise_for :users
  as :user do
    get '/register', to: 'devise/registrations#new', as: :register
    get '/login', to: 'devise/sessions#new', as: :login
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  devise_for :users, skip: [:sessions], :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    :roles
  end



  as :user do
    get "/login" => 'devise/sessions#new', as: :new_user_session
    post "/login" => 'devise/sessions#create', as: :user_session
    delete "/logout" => 'devise/sessions#destroy', as: :destroy_user_session
  end


 ##=====

  resources :usedmethods


  resources :deliverymethods


  resources :sourcetypes


  #resources :contenttags


  #resources :category1s

#  resources :category3s


#  resources :category2s

#  resources :category2s do
#    collection do
#      get 'newcat3' => 'category3s#new'#, as: :newcat3
#    end
#  end 

  resources :category1s do
    resources :category2s do
      resources :category3s
    end 
  end


  


  resources :portfolios do
    resources :opinions
  end




  #resources :sources

  #resources :subjects do
  #  resources :subject_modules
  #end 

  resources :sources do
    resources :contenttags
    resources :portfolios
    resources :opinions
  end

  resources :subjects do
    resources :subject_modules do
      resources :contenttags
      resources :portfolios
    end
    resources :contenttags

  end

match  ':controller/:action.:format'



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  #root :to => 'subjects#index'
  root :to => 'search#search'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  #######=========================
  #######HAS TO REMAIN AS LAST
  mount Blogit::Engine => '/blog'
        #the lines below were commented out in order to use the decorator instead of having to copy the whole post controller over
        #,
        #:controllers => {:posts => "posts"}


  get 'subject_tags/:tag', to: 'subjects#index', as: :subject_tag
  get 'source_tags/:tag', to: 'sources#index', as: :source_tag





  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end
end
