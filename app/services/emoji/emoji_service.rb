module Emoji
  class EmojiService
    ENDPOINT_URL = 'https://ranmoji.herokuapp.com/emojis/api/v.1.0/'
    private_constant :ENDPOINT_URL

    def initialize
    end

    def call
      request
    end

    private

    def request
      response = HTTParty.get(
        ENDPOINT_URL,
        headers: {
          'Content-Type' => 'application/json',
        }
      )
      HTMLEntities.new.decode(response['emoji'])
    end
  end
end
