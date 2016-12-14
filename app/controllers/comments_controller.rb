class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    unless @comments # nil 일 경우
      render json: "Comments 가 존재하지 않습니다."
      return
    end

    render json: @comments, each_serializer: CommentsSerializer
  end

  # GET /comments/1
  def show
    render json: @comment, serializer: CommentsSerializer
  end

  # POST /comments
  def create
    
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, serializer: CommentsSerializer, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      # params.fetch(:comment, {})
      params.permit(
        :content,
        :post_id
      )
    end
end
