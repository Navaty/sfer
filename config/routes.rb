Rails.application.routes.draw do
  root 'pages#welcome'
  resources :statements
  
  resources :tests do 
  	resources :surveys
  end


  resources :tcategories
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
