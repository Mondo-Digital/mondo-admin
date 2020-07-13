module Api
  module V1
    class UsersController < Api::V1::ApiController
      def create
        user = User.find_by("amazon_user_id = ? OR email = ?", 
                            *user_params.slice(:amazon_user_id, :email).values)

        if user.exists?
          user.update!(user_params)
        else
          User.create!(user_params)
        end

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
