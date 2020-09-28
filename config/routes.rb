Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about'
  namespace :blogs do 
    resources :searches, only: :index, defaults: { format: :json }
  end

  resources :messages
  resources :users, only: [:index, :show, :edit, :update]
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
