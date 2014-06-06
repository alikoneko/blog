Rails.application.routes.draw do
  namespace :admin do
    resources :posts
  end

  resource :sessions, path: 'session'

  resources :posts, path: '' do
    collection do
      get :archive
      get 'tags/:tag', to: 'posts#index', as: :tag
    end
  end
end
