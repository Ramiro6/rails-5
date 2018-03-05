Rails.application.routes.draw do
  get 'access/menu'

  get 'access/login'

  root 'demo#index'

  resources :sections do
    member do 
      get :delete
    end
  end

  resources :pages do
    member do 
      get :delete
    end
  end

  resources :subjects do 
    member do 
      get :delete
    end 
  end



  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/escape_output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
