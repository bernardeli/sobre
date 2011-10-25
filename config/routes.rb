Sobre::Application.routes.draw do
  devise_for :users do
    root :to => 'devise/registrations#new'
  end

  resources :dashboard, :only => :index do
    collection do
      get :success
    end
  end
  resources :users, :only => :show
  resources :pages, :only => [:show, :update]

  get '/get_started' => "public_pages#get_started", :as => 'get_started'
  get '/contact' => "public_pages#contact", :as => 'contact'
  post '/dispatch_email' => "public_pages#dispatch_email", :as => 'dispatch_email'

  match '/:username' => 'users#show', :as => 'users_show'
end
