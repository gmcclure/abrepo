Annobiblio::Application.routes.draw do
  get 'logout', to: 'sessions#destroy'

  resources :courses, except: :index do
    resources :bibliographies, except: :show
  end

  resources :bibliographies, except: :show do
    resources :entries
  end

  get '/student/:user_id/bibliographies', to: 'student_bibliographies#index', as: 'student_bibliographies'
  get '/student/:user_id/bibliography/:bibliography_id/edit', to: 'student_bibliographies#edit', as: 'edit_student_bibliography'

  get '/course/new_enrollment', to: 'courses#new_enrollment'
  post '/course/join', to: 'courses#join'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  root 'front#index'
end
