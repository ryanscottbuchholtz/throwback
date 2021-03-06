Throwback::Application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit]
  resources :dashboard, only: [:index]
  resources :memories, only: [:index, :edit, :destroy, :update]

  resources :contact, only: [:new, :create]
  get 'contact' => 'contacts#new'
  post 'contact' => 'contacts#create'

  resources :categories, only: [:show] do 
    resources :questions, only: [:index, :show]
  end

  resources :questions, only: [:index] do
    resources :memories, only: [:new, :create]
  end

  resources :questions, only: [:index] do
    resources :dna_questions, only: [:new, :create]
  end

  resources :testimonials, only: [:index]

  resources :samples, only: [:index]

  namespace :admin do
    root to: "admin#index"
    resources :questions, :categories, :users, :memories
  end


  #match 'contact' => 'contact#new', :as => 'contact', :via => :get
  #match 'contact' => 'contact#create', :as => 'contact2', :via => :post
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

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
