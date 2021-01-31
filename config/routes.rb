Rails.application.routes.draw do
  resources :statements
  resources :answers
  resources :questions
  resources :tests
  resources :tcategories
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
