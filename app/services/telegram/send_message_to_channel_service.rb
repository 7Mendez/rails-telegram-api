module Telegram
  class SendMessageToChannelService
    attr_reader :channel_name, :text_message

    ENDPOINT_URL = 'https://api.telegram.org/bot%<bot_token>s/sendMessage'
    private_constant :ENDPOINT_URL

    def initialize(channel, message)
      @channel_name = channel
      @text_message = message
    end

    def call
      request
    end

    private

    def request
      HTTParty.post(
        url_with_token,
        headers: {
          'Accept' => 'application/json',
          'Content-Type' => 'application/json',
          'User-Agent' => 'Telegram Bot SDK'
        },
        body: params.to_json
      )
    end

    def params
      {
        chat_id: "@#{channel_name}",
        text: text_message
      }
    end

    def url_with_token
      format(ENDPOINT_URL, bot_token: ENV['TELEGRAM_BOT_TOKEN'])
    end
  end
end






