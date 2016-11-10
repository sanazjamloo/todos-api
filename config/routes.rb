Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'todos#index'
  resources :todos, only: [:create, :show, :update, :index, :destroy]  
end
