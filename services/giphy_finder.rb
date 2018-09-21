module Services
  class GiphyFinder
    class << self
      def call(tag)
        new(tag).call
      end
    end

    def initialize(tag)
      @tag = tag
    end

    def call
      url = 'api.giphy.com/v1/gifs/random'
      options = {
        params: {
          api_key: 'b7YQ5MDy55SI9EXUliTOebl0wQPgywF6', # TODO: Using ENV['APIKEY']
          tag: @tag
        }
      }
      response = RestClient.get(url, options)
      JSON.parse(response).dig('data', 'images', 'downsized', 'url')
    end
  end
end
