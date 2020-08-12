module Presenters
  module News
    module Alexa
      def self.parse(news)
        [news].flatten.map do |item|
          {
            uid: item.id,
            updateDate: item.updated_at,
            titleText: item.title,
            mainText: item.body,
            redirectionUrl: item.link
          }
        end
      end
    end
  end
end
