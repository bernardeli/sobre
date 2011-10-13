Sobre::Application.routes.draw do
  devise_for :users do
    root :to => 'devise/registrations#new'
  end

  resources :welcome, :only => :index
  resources :dashboard, :only => :index
  resources :users, :only => :show
  resources :pages, :only => :update

  match '/get_started' => "welcome#get_started", :as => 'get_started'
  match '/contact' => "welcome#contact", :as => 'contact'
  match '/dispatch_email' => "welcome#dispatch_email", :as => 'dispatch_email'

  match '/:username' => 'users#show'
end
