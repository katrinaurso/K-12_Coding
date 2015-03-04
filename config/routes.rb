Rails.application.routes.draw do

  root 'admins#new'
  resources :admins
  resources :sessions, only: [:new, :create, :destroy]
  resources :dashboards
  resources :schools, only: [:show]
  resources :styles, only: [:edit, :update]
  delete 'logout' => 'sessions#destroy'
  get 'dphs', to: redirect('/schools/1')
  get 'chs', to: redirect('/schools/2')
  
end
