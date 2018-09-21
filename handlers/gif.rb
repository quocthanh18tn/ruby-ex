require_relative '../services/giphy_finder'

module Lita
  module Handlers
    class Gif < Handler
      route(/gif (.*)/i,
            :giphy,
            help: { 'gif' => 'replies back with giphy gif' })

      def giphy(response)
        response.reply(Services::GiphyFinder.call(response.match_data[1]))
      end

      Lita.register_handler(self)
    end
  end
end
