module Api
  module V1
    class MessagesController < ApplicationController

      def greet
        render :json => { message: "Hello #{current_user.email}!" }.as_json
      end

    end
  end
end
