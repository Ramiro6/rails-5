Rails.application.routes.draw do
  get 'subjects/index'
  get 'subjects/show'
  get 'subjects/new'
  get 'subjects/edit'
  get 'subjects/delete'

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  root 'demo#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
