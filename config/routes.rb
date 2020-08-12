Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  namespace "api", defaults: { format: :json } do
    namespace "v1" do
      resources :users, only: [:create]

      resources :teams, only: [], param: :team_id do
        collection do
          resources :news, only: %i[create index]
        end
      end
    end
  end

  namespace "app" do
    resources :users
    resources :teams
  end

  root to: "app/users#index"
end
