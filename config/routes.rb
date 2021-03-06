Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  
  resources :books
  
  resources :users, only: [:index, :show, :edit, :update] do
# ——————————————— ここから ———————————————
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
# ——————————— ここまでネストさせる ———————————

end

end