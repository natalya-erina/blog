Rails.application.routes.draw do
  get 'users/index'
  get 'users/:id/posts', to: 'users#posts', as: 'user_posts'
  get 'users/:id/admin', to: 'users#admin', as: 'user_admin'
  get 'users/:id/not_admin', to: 'users#remove_admin', as: 'user_remove_admin'
  devise_for :users
  resources :posts
  resources :users, except: [:new, :create, :destroy, :show, :edit]
  root "posts#index"
end
