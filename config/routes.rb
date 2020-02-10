Rails.application.routes.draw do
  root to: "pages#index"

  namespace :api do
    namespace :v1 do
      resources :users do
        member :do
          post :move
        end
      end
    end
  end
end
