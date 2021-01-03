Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
