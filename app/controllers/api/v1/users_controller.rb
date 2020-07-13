module Api
  module V1
    class UsersController < Api::V1::ApiController
      def create
        User
          .find_or_initialize_by(amazon_user_id: user_params[:amazon_user_id])
          .update!(user_params)

        head :ok
      end

      private

      def user_params
        params
          .permit(:email, :name, :amazon_user_id)
          .merge(
            password: Devise.friendly_token
          )
      end
    end
  end
end
