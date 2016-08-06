class ArgumentsController < ApplicationController
  before_action :set_argument, only: [:show, :update, :destroy]

  # GET /arguments
  # GET /arguments.json
  def index
    @arguments = Argument.all
  end

  # GET /arguments/1
  # GET /arguments/1.json
  def show
  end

  # POST /arguments
  # POST /arguments.json
  def create
    @argument = Argument.new(argument_params)

    if @argument.save
      render :show, status: :created, location: @argument
    else
      render json: @argument.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /arguments/1
  # PATCH/PUT /arguments/1.json
  def update
    if @argument.update(argument_params)
      render :show, status: :ok, location: @argument
    else
      render json: @argument.errors, status: :unprocessable_entity
    end
  end

  # DELETE /arguments/1
  # DELETE /arguments/1.json
  def destroy
    @argument.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_argument
      @argument = Argument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def argument_params
      params.require(:argument).permit(:subject_id, :title, :body, :rank)
    end
end
