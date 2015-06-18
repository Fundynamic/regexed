Regexed::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_for :users

  root to: 'welcome#index'

  get 'info/developers' => 'info#developers'
  get 'info/organisations' => 'info#organisations'
  get 'manifesto' => 'info#manifesto'
  get 'algemene-voorwaarden' => 'info#algemenevoorwaarden'
  get 'contact' => 'info#contact'
  get 'stats' => 'info#stats'
  get 'prijzen' => 'info#prijzen'

  authenticate :user do
    get 'aanmelden' => 'wizard#index'

    resources :skills, only: [:index]

    resources :opportunities, :shallow => true do
      post 'like', on: :member
      post 'dislike', on: :member
    end

    resource :developer, :shallow => true do
      post 'increase_likes', on: :member
      get 'opportunities_with_interest', on: :member
      get 'preferences', on: :member
    end

    resource :organisation, :shallow => true do
      get 'opportunities_with_interest', on: :member
      get 'closed_opportunities', on: :member
    end
  end


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
