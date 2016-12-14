class CounselorsController < ApplicationController
  before_action :set_counselor, only: [:show, :update, :destroy]

  # GET /counselors
  def index
    @counselors = Counselor.all

    render json: @counselors
  end

  # GET /counselors/1
  def show
    render json: @counselor
  end

  # POST /counselors
  def create
    @counselor = Counselor.new(counselor_params)

    if @counselor.save
      render json: @counselor, status: :created, location: @counselor
    else
      render json: @counselor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /counselors/1
  def update
    if @counselor.update(counselor_params)
      render json: @counselor
    else
      render json: @counselor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /counselors/1
  def destroy
    @counselor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counselor
      @counselor = Counselor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def counselor_params
      params.fetch(:counselor, {})
    end
end
