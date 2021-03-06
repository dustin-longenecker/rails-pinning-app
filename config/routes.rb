Rails.application.routes.draw do
  resources :users, except: [:index]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pins#index'
  ######USERS#######
#
#get "/users/new" => "users#new"
get "/users" => "users#index"
get "/login" => "users#login"
post "/login" => "users#authenticate"

  #get "pins/name-:slug" => "pins#show_by_name"
  get "/pins/name-:slug" => "pins#show_by_name", as: 'pin_by_name' 

  get '/signup' => "users#new", as: :signup


  resources :pins
 # get "/pins/:id" => "pins#show"

  #READ
  get "/library" => "pins#index"
  #CREATE
  # get "pins_path" => "pins#new"
  # post "pins_path" => "pins#create"
  # #UPDATE
  # get "edit_pin_path" => "pins#edit"
  # get "edit_user_path" => "pins#edit"
  # put "pin_path" => "pins#update"
  # #DELETE
  # delete "/pins/:id" => "pins#destroy"




  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
