module Api::V1
  class SearchesController < ApplicationController
    def search
      # TODO: implement Sphinx search by text
      text = CGI::unescape(params[:text])
      subjects = Subject.search(text)
      render json: subjects
    end
  end
end
