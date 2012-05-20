Fispo::Application.routes.draw do

  resources :roles

  get "page/home"

  get "page/index"

  get "page/about"

  get "page/contact"

  #root :to => 'page#home'
  root :to => "home#main"

 get "/home/subscription"
  get "home/eventi"
  get "home/quesiti"
  get "home/modulistica"

  resources :books do
    collection do
      get :fiction
      get :history
      get :sports
    end
  end

   devise_for :accounts
  resources :top_sections
  resources :contents
  resources :sections
  resources :users
   #member
  resources :home do
    collection do
      get :show
      get :index
      get :main
      get :subscription
      get :vademecum
      get :modulistica
    end
    member do

       get :show_article

    end

  end


   # devise_for :users
    #devise_for :contents


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #  match 'products/:id' => 'catalog#view'
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
  # just remember to delete public/_index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
