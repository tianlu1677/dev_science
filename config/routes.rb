Rails.application.routes.draw do
  root 'home#index'
  mount API => '/'

  devise_for :users, :controllers =>
                       { :sessions => "users/sessions",
                         :registrations => "users/registrations",
                         :confirmations => "users/confirmations",
                         :passwords => "users/passwords",
                         :emails=>"users/emails"
                       }

  namespace :users do
    resources :center do
      get :edit, on: :collection
      patch :update_password, on: :collection
      get :joined_organizations, on: :collection
      get :joined_groups, on: :collection
    end
  end
  resources :comments do
    get :reply
  end
  concern :commentable do
    resources :comments, except: [ :new, :show ]
    get '/comments/reply/:id' => 'comments#reply', as: :reply_comment
  end

  resources :organizations do
    resources :organizations_users do
      delete :leave, on: :collection
    end
    resources :groups_organizations
  end
  resources :groups do
    resources :topics
    resources :groups_users do
      delete :leave, on: :collection
    end
  end

  resources :topics, concerns: [ :commentable  ]

  resources :tags
  resources :attachments
  resources :resources

  ## for admin routes
  namespace :admin do
    root to: "panel#index"
    resources :panel do
      get :settings, on: :collection
    end
    resources :users do
      resources :profile
      resources :experiences
    end
    resources :experiences
    resources :organizations do
      resources :organizations_users
    end
    resources :organizations_users
    resources :groups do
      resources :groups_users
    end
    resources :groups_users


    resources :topics do
      resources :posts
    end
    resources :posts
    resources :comments
    resources :tags
    resources :resources
    resources :roles
    resources :permissions
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
  #     # (ap p/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  if File.exist? "#{Rails.root}/config/engine_routes.rb"
    instance_eval File.read "#{Rails.root}/config/engine_routes.rb"
  end
end
