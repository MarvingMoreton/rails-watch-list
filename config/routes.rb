Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: %i[ new create show] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: :destroy
end
