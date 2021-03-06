Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # delete :sessions, to: 'sessions#destroy'
  # resources :users, only: :create
  # resources :sessions, only: :create
  root to: 'tests#index'


  resources :badges, only: :index
  resources :feedback, only: [:new, :create]

  resources :tests, only: :index do
    member do
      post :start
    end
  end

   resources :test_passages, only: %i[show update] do
     member do
       get :result
       post :gist
     end
   end

   namespace :admin do
     resources :badges
     resources :timers, except: [:index, :show]
     resources :tests do
       resources :timers, except: [:index, :show]
       patch :update_inline, on: :member
       patch :public_test, on: :member
       resources :questions, shallow: true, except: :index do
         resources :answers, shallow: true, except: :index
       end
     end
     resources :gists, only: %i[index show]
   end

 end
