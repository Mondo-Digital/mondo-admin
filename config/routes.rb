Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :users, only: [:create]
    end
  end
end
