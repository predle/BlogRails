Rails.application.routes.draw do
  
  resources :posts do
    resources :comments do
    end
  end

end
