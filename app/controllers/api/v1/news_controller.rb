module Api
  module V1
    class NewsController < Api::V1::ApiController
      def index
        render json: Presenters::News::Alexa.parse(current_team.news)
      end

      def create
        @news = current_team.news.new(news_params)

        if @news.save
          head :ok
        else
          render json: @news.errors, status: :unprocessable_entity
        end
      end

      private

      def news_params
        params.permit(:body, :title, :link)
      end
    end
  end
end
