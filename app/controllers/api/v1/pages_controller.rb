module Api
  module V1
    class PagesController < ApplicationController
  
      def greet
        render :json => {message: "Hello World!"}.as_json
      end

    end
  end
end
