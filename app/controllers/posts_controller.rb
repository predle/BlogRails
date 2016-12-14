class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.where(user_id: params[:user_id])

    unless @posts # nil 일 경우
      render json: "해당 User에대한 Comment 가 없습니다."
      return
    end
    
    # 기본
      # render json: @posts

    # {{JSON:API}} 사용
    render json: @posts, each_serializer: PostsSerializer
  end

  # GET /posts/1
  def show
    render json: @post, serializer: PostsSerializer
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, serializer: PostsSerializer, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      # params.fetch(:post, {})
      params.permit(
        :title,
        :content,
        :user_id
      )
    end
end
