Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true

  end


get 'questions/', to: 'questions#all_questions'
#get 'tests/:test_id/questions/create', to: 'questions#create'
post 'tests/:test_id/questions/create', to: 'questions#create'



get 'tests/:test_id/questions/destroyed', to: 'questions#destroyed'
get 'tests/:test_id/questions/destroy', to: 'questions#destroy'


end
