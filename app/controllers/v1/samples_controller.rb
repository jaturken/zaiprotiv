module V1
  class SamplesController < ApplicationController
    before_action :set_sample, only: [:show, :update, :destroy]

    # GET /samples
    # GET /samples.json
    def index
      @samples = Sample.all
    end

    # GET /samples/1
    # GET /samples/1.json
    def show
    end

    # POST /samples
    # POST /samples.json
    def create
      @sample = Sample.new(sample_params)

      if @sample.save
        argument_ids = params[:argument_ids].flatten.compact rescue []
          unless argument_ids.empty?
            ActiveRecord::Base.transaction do
              argument_ids.map do |argument_id|
                @sample.sample_arguments.create(argument_id: argument_id)
              end
            end
          end
        render json: @sample
      else
        render json: @sample.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /samples/1
    # PATCH/PUT /samples/1.json
    def update
      if @sample.update(sample_params)
        render :show, status: :ok, location: @sample
      else
        render json: @sample.errors, status: :unprocessable_entity
      end
    end

    # DELETE /samples/1
    # DELETE /samples/1.json
    def destroy
      @sample.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_sample
        @sample = Sample.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def sample_params
        params.permit(:subject_id, argument_id: [])
      end
  end
end
