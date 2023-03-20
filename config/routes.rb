Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :coupons do
    resources :bookmarks, only: %i[show new create]
  end
  resources :coupons, only: :destroy do
    member do
      patch :approve, :reject
    end
  end

  resources :bookmarks, only: :destroy do
    member do
      patch :approve, :reject
    end
  end
end
