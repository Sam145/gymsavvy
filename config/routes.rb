Gymsavvy::Application.routes.draw do


  get "exercises/index"

  root to: 'users#new'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"

 # Mens programmes
  get "bulking_up" => "admin_programs#bulking", :as => "bulking"
  get "lean_machine" => "admin_programs#lean", :as => "lean"
  get "lose_a_few" => "admin_programs#lose", :as => "lose"

  # Womans programmes
  get "pear_shape" => "admin_programs#pear", :as => "pear"
  get "apple_shape" => "admin_programs#apple", :as => "apple"
  get "hour_glass_shape" => "admin_programs#hour", :as => "hour"
  get "celery_shape" => "admin_programs#celery", :as => "celery"

  get "common_injuries" => "admin_programs#injuries", :as => "injuries"
  get "avoid_injury" => "admin_programs#avoid", :as => "avoid"

  resources :sessions
  resources :users
  resources :program_sets
  resources :exercises



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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
