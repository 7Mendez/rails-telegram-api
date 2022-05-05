module Telegram
  class SendEmojiToChannelService
    attr_reader :channel_name

    ENDPOINT_URL = 'https://api.telegram.org/bot%<bot_token>s/sendMessage'
    private_constant :ENDPOINT_URL

    def initialize(channel)
      @channel_name = channel
    end

    def call
      emoji = Emoji::EmojiService.new.call

      t = Telegram::SendMessageToChannelService.new(channel_name, emoji)
      t.call
    rescue
      false
    end
  end
end
