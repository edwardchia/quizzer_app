Rails.application.routes.draw do
  resources :tests do
    resources :questions, only: [:create, :destroy, :edit, :update]
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
