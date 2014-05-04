Rails.application.routes.draw do
  resources :posts do
    collection do
      get :archive
    end
  end
end
