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
      get :index
    end 
  end 
#put 'edit', to: 'users#update'
  
  
  #get 'comment', to: 'users#commnet'
  #post 'comment', to: 'comments#create'
  

  resources :documents do
    resources :comments, only: [:create, :destroy]
  end 
    
  
  
  get 'documents/download/:id' => 'documents#download', as: :download
  
  resources :posts, only: [:create, :destroy]
  
 
  get  'upload', to: 'uploader#form'
  post 'uploader/upload'
  
  
  resources :favorites, only: [:create, :destroy]


  resources :comments, only: [:create, :destroy]
end
