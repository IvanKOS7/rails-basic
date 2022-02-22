Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :sessions, to: 'sessions#destroy'
  resources :users, only: :create
  resources :sessions, except: :index


  resources :tests do
     resources :questions, shallow: true, except: :index do
       resources :answers, shallow: true, except: :index
     end

     member do
       post :start
     end
   end

   resources :test_passages, only: %i[show update] do
     member do
       get :result
     end
   end

 end
