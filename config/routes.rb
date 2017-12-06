Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root             'static_pages#home'
  get 'faq'        => 'static_pages#faq'
  get 'kontakt'  => 'static_pages#kontakt'
  get 'impressum'  => 'static_pages#impressum'
  get 'formulare'  => 'static_pages#formulare'
  get 'netzwerk'  => 'static_pages#netzwerk'  
  get 'service'    => 'static_pages#service'
  get 'raumpool'    => 'static_pages#raumpool'
  get 'signup'     => 'users#new'
  get 'user_rooms' => 'users#show'
  get  'login'   => 'sessions#new'
  get 'rooms/:id' => 'rooms#show_room'
  get 'roomlist' => 'rooms#list_rooms'
  post   'login'   => 'sessions#create'
  post 'rooms/:id' => 'rooms#edit'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :rooms
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
#  resources :rooms,          only: [:destroy, :create]
#  resources :rooms,          only: [:index, :show]  do

  resources :rooms do
    collection do
      match 'suche' => 'rooms#index', via: [:get, :post], as: :suche
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
