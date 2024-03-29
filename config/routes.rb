require 'api_constraints'

Batontouchme::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :tasks do
        resources :tradestats, only: [:create, :destroy, :update]
        collection do
          get 'askedbatons'
          get 'mytaskbatons'
          post 'task_create'
        end
        
        member do
          put 'selectclient'
          put 'clientcomplete'
          put 'userconfirm_yes'
          put 'userconfirm_no'
        end
      end

      resources :stores, only: [:index, :show]

      resources :giftitems, only: [:index, :show] do
        member do
          get 'check'
        end
      end

      resources :users, only: [:show] do
        collection do
          get 'user_current'
        end
      end
      
      devise_scope :user do
        resources :sessions, only: [:create, :destroy]
        post 'registrations' => 'registrations#create'
      end

      resources :reviews, only: [:create, :show] do
        collection do
          post 'create_by_client'
        end
      end

      match "/check_mobile_login", to: 'main#check_mobile_login', via: :get # check_mobile_login(Facebook)
    end
  end

  # resources :tasks

  match "/home", to: "main#home"
  root to: "main#home"
  
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, 
              controllers: { omniauth_callbacks: "omniauth_callbacks"}
  

  # devise_scope :user do
  #   resources :sessions, only: [:create, :destroy] # Session 
  # end


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
