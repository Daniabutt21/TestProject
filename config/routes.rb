Rails.application.routes.draw do
  devise_for :users   
  resource :admins 
  resource :buyers
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

end  
