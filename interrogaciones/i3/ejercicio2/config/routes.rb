Rails.application.routes.draw do
  resources :data_entries, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]
end
