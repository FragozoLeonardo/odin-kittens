# frozen_string_literal: true

Rails.application.routes.draw do
  resources :kittens
  root 'kittens#index'
end
