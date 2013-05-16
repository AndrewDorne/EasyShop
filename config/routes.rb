EasyShop::Application.routes.draw do

  resources :line_items

  root :to=>"pages#home"
  devise_for :users

  devise_for :users, :controllers => { :registrations => "registrations",
                                       :sessions => "sessions" }

  resources :items do
    collection do
      get 'index'
      get 'results'
    end
  end

  resources :comments, :reviews, :categories, :items, :charges, :users, :carts
  resources :items do
    resources :reviews
  end
  resources :users do
    resources :reviews
  end

  match 'items/results/:rsize/:search' => "items#results"
  match 'items/results/:rsize' => "items#results"
  # match '/items#index' => redirect("items#results")
  match '/add_to_cart' => 'carts#add_to_cart', :via => :put

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/sign_up" => "devise/registrations#new"
  end



  
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
