Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  
  resources :contacts, only: :create
  get 'contact-us', to: "contacts#new", as: "new_contact"
  
  root 'pages#index'

  resources :tests, only: :index do
    member do
      post :start
    end
  end


  resources :test_passages, only: %i[show update] do 
    member do 
      get :result
      post :gist, to: 'gists#create'
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      post :publish, on: :member
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end

