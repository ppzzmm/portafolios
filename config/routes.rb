# frozen_string_literal: false

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :portfolios, only: %i[show]
      resources :stocks, only: %i[show]
    end
  end
end
