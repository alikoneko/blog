Rails.application.routes.draw do
  get 'tags/:tag', to: 'posts#index', as: :tag

  namespace :admin do
    resources :posts
  end

  resource :sessions, path: 'session'

  resources :posts, path: '' do
    collection do
      get :archive

    end
  end
end
