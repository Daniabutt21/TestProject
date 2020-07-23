Rails.application.routes.draw do
  devise_for :users , controllers: {
    sessions: 'users/sessions'
  }
  
  devise_scope :user do 
    get '/users/sign_in' , to: 'devise/sessions#new', :as => :login
  end
  devise_for :users, skip: :all
  resources :admins do
    collection do
      get :charge_user
    end
  end
  resources :buyers
  resources :usages
  resources :plans do
  	resources :features
  end
  resources :plans do
    resources :subscriptions
  end
  resources :users do
    resources :subscriptions
  end
  resources :users do
    resources :transactions
  end
  root to: 'home#index'
end  
