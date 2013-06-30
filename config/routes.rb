Annobiblio::Application.routes.draw do
  resources :courses, except: :index do
    resources :bibliographies, except: :show
  end

  # resources :users, except: [:new, :create, :edit, :update, :show, :index, :destroy] do
  #   resources :bibliographies
  # end

  get '/course/new_enrollment', to: 'courses#new_enrollment'
  post '/course/join', to: 'courses#join'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'
  root 'front#index'
end
