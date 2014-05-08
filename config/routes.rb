Rails.application.routes.draw do
  resources :posts do
    collection do
      get :archive
    end
  end

  namespace :admin do
    resources :posts
  end

  resource :sessions, path: 'session'
end
