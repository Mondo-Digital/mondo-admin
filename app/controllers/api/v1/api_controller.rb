module Api
  module V1
    class ApiController < ActionController::Base
      protect_from_forgery with: :null_session
      before_action :validate_api_token!

      def validate_api_token!
        head :forbidden unless valid_client_token? || valid_request_token?
      end

      private

      def valid_client_token?
        request.headers["HTTP_CLIENT_TOKEN"] == ENV.fetch("CLIENT_TOKEN")
      end

      def valid_request_token?
        request.params.fetch("token", "")
      end
    end
  end
end
