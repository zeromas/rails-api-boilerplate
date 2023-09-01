Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resource :current_user, only: %i[show]
  resources :users

  get :status, to: 'application#status'
end
