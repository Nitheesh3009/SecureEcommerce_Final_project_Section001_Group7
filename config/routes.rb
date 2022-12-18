Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'enter_otp/:id', to: 'users/sessions#enter_otp', as: 'enter_otp'
    post 'verify_otp/:id', to: 'users/sessions#verify_otp', as: 'verify_otp'
    get 'users/:id/resend_otp', to: 'users/sessions#resend_otp', as: 'resend_otp'
  end

  resources :home, only: [:index]
  resources :properties do
    member do
      get :buy
    end
  end
  resources :my_properties do
    member do
      get :cancel
      get :pay
      get :create_pay
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
