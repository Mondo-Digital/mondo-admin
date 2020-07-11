module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :validate_api_header_token!

      def create
        User.create!(user_params)

        head :ok
      end

      private

      def user_params
        params
          .permit(:email)
          .merge(
            password: Devise.friendly_token
          )
      end
    end
  end
end
