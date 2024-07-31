Rails.application.routes.draw do
  devise_for :users
  
  # Define a rota raiz
  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end

  resources :posts

  # Outras rotas aqui...
end
