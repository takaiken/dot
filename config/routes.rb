Rails.application.routes.draw do
  

    get 'home/index'
    get 'home/show'
    post '/home/guest_sign_in', to: 'home#guest_sign_in'
  
    devise_for :users, :controllers => {
      :registrations => 'users/registrations',
      :sessions => 'users/sessions'} 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  
  root 'home#index'
end
