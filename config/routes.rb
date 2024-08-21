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

  match '/404', to: 'plataforms/errors#not_found', via: :all
  match '/422', to: 'plataforms/errors#unprocessable_entity', via: :all
  match '/500', to: 'plataforms/errors#internal_server_error', via: :all

  match '*path', to: 'plataforms/errors#not_found', via: :all
end
