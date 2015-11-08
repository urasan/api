Rails.application.routes.draw do
  resources :threads, only: [] do
    resources :messages, only: [] do
      resources :dislikes, only: %w(create) do
        collection do
          get :count
        end
      end
    end
  end
end
