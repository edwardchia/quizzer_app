Rails.application.routes.draw do
  get 'welcome/home'
  resources :questions
  resources :tests
  resources :users, only: [:new, :show, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]

  get("/", to: "welcome#home", as: :root)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
