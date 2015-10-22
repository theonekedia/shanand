Rails.application.routes.draw do

  resources :risk_and_returns

  resources :industry_details

  root to: 'script_meta_data#home'  
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
  resources :balance_sheets,  param: :nse_script_name, only: [:index]
  resources :financials, param: :nse_script_name, only: [:edit, :update]
  

#Special Paths starts
get '/graham_to_price', to: 'day_tradings#graham_vs_price', as: 'graham_to_price'  
get '/balance_sheet/:nse_script_name', to: 'financials#show_balance_sheet', as: 'show_balance_sheet'
get '/profit_and_loss/:nse_script_name', to: 'financials#show_profit_loss', as: 'show_profit_loss'
get '/company_info/:nse_script_name', to: 'company_details#show', as: 'company_details'
get '/search',to: 'script_meta_data#search', :as => :search
get '/number_of_shares/:nse_script_name',to: 'script_meta_data#no_of_shares', :as => :number_of_shares



end
