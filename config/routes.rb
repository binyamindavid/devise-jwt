Rails.application.routes.draw do
  root 'home#index'
  get 'home/secret'
  devise_for :users

  namespace :api, defaults: { format: :json } do
    # devise_for :users, controllers: {sessions: 'api/sessions'}
    devise_scope :user do
      post '/authentication_tokens/create', to: "authentication_tokens#create"
    end
  end
end
