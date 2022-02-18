Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: %i[show create new] do
    resources :bookmarks, only: %i[index create new]
  end
  resources :bookmarks, only: :destroy
end
