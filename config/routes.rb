Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#welcome'

  resources :statements, only: [:show, :index]

  namespace :admin do
    resources :statements, exept: [:new, :create] do
    	get 'update_certificate', on: :member
    end
  end
  
  resources :tests do 
  	resources :surveys
  	resources :statements, only: [:new, :create]
  end


  resources :tcategories
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
