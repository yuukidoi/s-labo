Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :likes
      get :mylog
    end 
  end 
  
  get 'comment', to: 'users#commnet'
  
  
  post 'edit', to: 'users#update'
  resources :documents
  get 'documents/download/:id' => 'documents#download', as: :download
  
  resources :posts, only: [:create, :destroy]
  
 
  get  'upload', to: 'uploader#form'
  post 'uploader/upload'
  
  
  resources :favorites, only: [:create, :destroy]


  resources :comments, only: [:create, :destroy]
end
