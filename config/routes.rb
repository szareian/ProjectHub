Rails.application.routes.draw do
  get 'group_notifications/index'

  get 'notifications/index'

  resources :change_passwords
  resources :group_requests
  resources :group_memberships
  resources :groups
  resources :widgets
  resources :user_logins
  resources :active_users
  resources :companies
  resources :users
  resources :task_comments

  put "/readnotification", to: "notifications#readNotification"
  get "/getnotifications", to: "notifications#getNotifications"
  get "/notifications", to: "notifications#index"
  get "/group_notifications", to: "group_notifications#index"
  get "/notificationalert", to: "notifications#alertNotification"

  get '/respond_to_request', to: 'group_requests#respond_to_request', as: :respond_to_request
  post '/process_leave_grp', to: 'groups#process_leave_grp', as: :process_leave_grp

  resources :tasks do
    member do
      get "update_vote" => 'tasks#update_vote'
      get "vote_for_points" => 'tasks#vote_for_points'
    end
  end

  resources :points do
    member do
      put "positive" => "points#upvote"
      put "negative" => "points#downvote"

      get "positive" => "points#upvote"
      get "negative" => "points#downvote"
    end
  end

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
