Rails.application.routes.draw do
  post 'microposts/create'
  post 'microposts/:id/destroy' => 'microposts#destroy'
  get 'microposts/:id/edit' => 'microposts#edit'
  post 'microposts/:id/update' => 'microposts#update'
  root 'pages#index'
  get 'pages/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
