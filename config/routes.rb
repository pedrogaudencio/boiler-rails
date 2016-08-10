Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => "registrations"
  }
  root 'static_pages#index'
  get 'static_pages/index'
  resources :users, only: [:show, :edit, :update] do
    get :me, on: :collection
  end
end
