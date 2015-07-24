Rails.application.routes.draw do

  resources :risk_and_returns

  resources :industry_details

  root to: 'ratios_and_analyses#home'  
# of users begin
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  #resources :users
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  #get '/users/:id' => 'users#show', as: 'profile'
  get '/profile', to: 'users#show', as: 'profile'  # it should be modified
# of User's end

  resources :script_meta_data, param: :nse_script_name
  resources :ratios_and_analyses,	param: :nse_script_name, only: [:index, :show]
  resources :day_tradings,	param: :nse_script_name, only: [:index]
  resources :financials, param: :nse_script_name, only: [:edit, :update]
  

#Special Paths starts
get '/graham_to_price', to: 'day_tradings#graham_vs_price', as: 'graham_to_price'  
get '/balance_sheet/:nse_script_name', to: 'financials#show_balance_sheet', as: 'show_balance_sheet'
get '/profit_and_loss/:nse_script_name', to: 'financials#show_profit_loss', as: 'show_profit_loss'
get '/company_info/:nse_script_name', to: 'company_details#show', as: 'company_details'


#Special Paths ends

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # resources :balance_sheets,   param: :nse_script_name, only: [:edit, :update]
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
