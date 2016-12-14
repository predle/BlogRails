Rails.application.routes.draw do

  resources :counselors
  resources :posts
  resources :comments
  resources :users

  resources :posts do
    resources :comments do
    end
  end

end
