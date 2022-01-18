Rails.application.routes.draw do

  # 顧客ページ
 scope module: :public do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/users/my_page' => 'users#show'
  get '/users/edit' => 'users#edit'
  patch '/users' => 'users#update'
  get '/users/unsubscribe' => 'users#unsubscribe'
  patch '/users/withdraw' => 'users#withdraw'

  resources :treatments, only: [:index, :show] do
  end

  resources :reservations, only: [:new, :create, :index, :show] do
   collection do
    post :confirm
    get :complete
  end
  end
end

#   devise_for :users, controllers: {
#   sessions:      'public/users/sessions',
#   passwords:     'public/users/passwords',
#   registrations: 'public/users/registrations'
# }

  # 管理者ページ
  devise_for :admins, controllers: {
  sessions:      'admin/admins/sessions',
  passwords:     'admin/admins/passwords',
  # registrations: 'admin/registrations'
}
  namespace :admin do
    get '/' => 'homes#top'
    resources :treatments
    resources :genres, only:[:index, :create, :edit, :update, :destroy]
    resources :users, only:[:index, :show, :edit, :update]
    resources :reservations, only:[:show, :update]
 end

end
