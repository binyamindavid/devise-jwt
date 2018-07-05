Rails.application.routes.draw do
  root 'home#index'
  get 'home/secret'
  devise_for :users

  namespace :api, defaults: { format: :json } do
    devise_for :users, controllers: {sessions: 'api/sessions'}
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
  end

end
