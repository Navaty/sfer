Rails.application.routes.draw do
  root 'pages#welcome'
  #resources :statements
  resources :statements, exept: [:new, :create] do
  	get 'update_certificate', on: :member
  end
  
  resources :tests do 
  	resources :surveys
  	resources :statements, only: [:new, :create ]
  end


  resources :tcategories
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
