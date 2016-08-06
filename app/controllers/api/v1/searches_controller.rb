module Api::V1
  class SearchesController < ApplicationController
    def search
      # TODO: implement Sphinx search by text
      text = CGI::unescape(params[:text])
      render json: { text: text }
    end
  end
end
