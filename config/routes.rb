Rails.application.routes.draw do
  resources :threads, only: [] do
    resources :messages, only: [] do
      resources :dislikes, only: %w(index)
      post 'dislikes/create' => 'dislikes#create'
      post 'dislikes/destroy' => 'dislikes#destroy'
    end
  end
end
