require 'sidekiq-scheduler'

class TelegramBotMessagesJob
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    service = Telegram::SendEmojiToChannelService.new(ENV['TELEGRAM_BOT_CHANNEL'])
    service.call
  rescue
    false
  end
end
