Sobre::Application.routes.draw do
  devise_for :users do
    root :to => 'devise/registrations#new'
  end

  resources :welcome, :only => :index
  resources :dashboard, :only => :index
  resources :users, :only => :show
  resources :pages, :only => :update
  resources :welcome, :only => [] do
    collection do
      get 'get_started'
    end
  end

  match '/:username' => 'users#show'
end
