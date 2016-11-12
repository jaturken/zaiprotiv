class SampleArgumentsController < ApplicationController
  before_action :set_sample_argument, only: [:show, :update, :destroy]

  # GET /sample_arguments
  # GET /sample_arguments.json
  def index
    @sample_arguments = SampleArgument.all
  end

  # GET /sample_arguments/1
  # GET /sample_arguments/1.json
  def show
  end

  # POST /sample_arguments
  # POST /sample_arguments.json
  def create
    @sample_argument = SampleArgument.new(sample_argument_params)

    if @sample_argument.save
      render :show, status: :created, location: @sample_argument
    else
      render json: @sample_argument.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sample_arguments/1
  # PATCH/PUT /sample_arguments/1.json
  def update
    if @sample_argument.update(sample_argument_params)
      render :show, status: :ok, location: @sample_argument
    else
      render json: @sample_argument.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sample_arguments/1
  # DELETE /sample_arguments/1.json
  def destroy
    @sample_argument.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_argument
      @sample_argument = SampleArgument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_argument_params
      params.require(:sample_argument).permit(:sample_id, :argument_id)
    end
end
