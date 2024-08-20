# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end

  unauthenticated do
    devise_scope :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  scope module: :plataforms do
    resources :posts
  end
end
