Rails.application.routes.draw do

  root to: 'home#index'

  resources :poll_results, only: [:index]

  resources :municipalities, only: [] do
    resources :answers, only: [:new, :create]
  end
end
