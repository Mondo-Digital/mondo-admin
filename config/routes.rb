Rails.application.routes.draw do
  devise_for :users

  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :users, only: [:create]
    end
  end

  namespace 'app' do
    resources :users, only: [:index]
  end

  root to: 'app/users#index'
end
