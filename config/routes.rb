Annobiblio::Application.routes.draw do
  resources :courses

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'
  root 'front#index'
end
