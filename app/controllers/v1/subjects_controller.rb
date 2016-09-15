module V1
  class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :update, :destroy]

    # GET /subjects
    # GET /subjects.json
    def index
      @subjects = Subject.all
      render json: @subjects
    end

    # GET /subjects/1
    # GET /subjects/1.json
    def show
      @subject = Subject.find(params[:id])
      render json: @subject
    end

    # POST /subjects
    # POST /subjects.json
    def create
      @subject = Subject.new(subject_params)

      if @subject.save
        argument_params = params[:arguments].first.values.flatten.compact rescue []
        unless argument_params.empty?
          ActiveRecord::Base.transaction do
            argument_params.map do |p|
              @subject.arguments.create(p.except('id', 'isImportant'))
            end
          end
        end
        render :show, status: :created, location: v1_subject_url(@subject, format: :json)
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
        argument_params = [:title, :body, :positive]
        params.require(:subject).permit(:name, :description, :image_url, arguments: [positive: argument_params, negative: argument_params])
      end
  end
end
