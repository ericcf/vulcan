Vulcan::Application.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]

  resources :projects do
    resources :tickets
  end

  root to: 'projects#index'
end
