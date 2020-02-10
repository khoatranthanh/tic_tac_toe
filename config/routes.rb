Rails.application.routes.draw do
  root to: "pages#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        collection do
          post :move
        end
      end

      resources :boards, only: :index
    end
  end
end
