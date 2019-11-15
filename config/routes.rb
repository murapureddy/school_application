Rails.application.routes.draw do

  root 'login#new'
  get 'login' => 'login#new'
  post 'login' => 'login#create'
  get 'logout' => 'login#destroy'
  resources :students, only: [:index,:new, :create,:edit,:update]

  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
