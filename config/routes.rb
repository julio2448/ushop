Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  get "/coupons/my_coupons", to: "coupons#my_coupons", as: :my_coupons
  get "/coupons/my_bookmarks", to: "bookmarks#my_bookmarks", as: :my_bookmarks
  resources :coupons do
    resources :bookmarks, only: %i[index show new]
  end

  post '/coupons/:coupon_id/bookmarks', to: 'bookmarks#create', as: "create_bookmark"

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
