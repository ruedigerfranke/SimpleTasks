# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects do
    resources :tasks do
      member do
        patch :move
      end
    end
  end
  devise_for :users

  root to: 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
