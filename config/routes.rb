Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :users

  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/landing_page'
  get 'simple_pages/index'

  post 'orders/create'
  post 'orders/destroy'
  post 'simple_pages/thank_you'

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

end
