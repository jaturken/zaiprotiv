module V1
  class ArgumentsController < ApplicationController
    before_action :set_subject, only: [:show, :update, :destroy]

    # GET /subjects/1/arguments
    def index
      subject = Subject.find(params[:subject_id])
      arguments = subject.arguments.select(:id, :title, :body, :rank, :positive)
      pos, neg = arguments.partition{ |arg| arg.positive? }

      render json: { positives: pos, negatives: neg }
    end

    # GET /subjects/1/arguments/1
    def show
      argument = Argument.find(params[:id])
      render json: argument
    end

    # POST /subjects
    # POST /subjects.json
    def create
      @subject = Subject.new(subject_params)

      if @subject.save
        render :show, status: :created, location: @subject
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /subjects/1
    # PATCH/PUT /subjects/1.json
    def update
      if @subject.update(subject_params)
        render :show, status: :ok, location: @subject
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    end

    # DELETE /subjects/1
    # DELETE /subjects/1.json
    def destroy
      @subject.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_subject
        @subject = Subject.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def subject_params
        params.require(:subject).permit(:name, :description, :image_url)
      end
  end
end
