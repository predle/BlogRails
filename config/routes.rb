Rails.application.routes.draw do
  
  # 첫번째 사용자의 정보를 가져올 경우
  # users/1
  # 첫번째 사용자의 Post 목록을 가져올 경우
  # users/1/posts
  # 첫번째 사용자의 Post 1 번쨰의 댓글을 가져올 경우 
  # users/1/posts/1/comments
    
  resources :users do
    resources :posts do
      resources :comments do
      end
    end
  end

end
