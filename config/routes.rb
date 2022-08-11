Rails.application.routes.draw do
root 'home#index'
resources :lists, only: %i[index new create show]
end
