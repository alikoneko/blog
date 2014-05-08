Rails.application.routes.draw do
  resources :posts, path: '' do
    collection do
      get :archive

    end
  end

  get 'tags/:tag', to: 'posts#index', as: :tag

  namespace :admin do
    resources :posts
  end

  resource :sessions, path: 'session'

end
