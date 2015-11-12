Rails.application.routes.draw do
  resources :threads, only: [] do
    resources :messages, only: [] do
      resources :dislikes, only: %w(create)
    end
  end
end
