module Api
  module V1
    class NewsController < Api::V1::ApiController
      before_action :set_team

      def index
        @news = @team.news
      end

      def create
        @news = News.new(news_params)

        if @news.save
          head :ok
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end

      private

      def set_team
        @team = Team.find(params[:team_id])
      end

      def news_params
        params.permit(:team_id, :body)
      end
    end
  end
end
