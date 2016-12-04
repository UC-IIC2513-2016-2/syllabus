Rails.application.routes.draw do
  resources :journal_entries
  namespace :api do
    resources :journal_entries, only: [:index, :create]
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
