# Telegram Channel Send Message + Sidekiq

## Includes
- Using Henry - Rails 7 start init template.
- Httparty.
- Telegram Bot API.
- Ranmoji API.
- Sidekiq.
- Sidekiq scheduler.

## Note
- Only works whit channels where bot have permissions.

## Set ENV
```
# .env

TELEGRAM_API_KEY=YOUR-API-TOKEN
TELEGRAM_BOT_CHANNEL=YOUR-BOT-CHANNEL
SEND_AUTOMATIC_TO_CHANNEL=true
SEND_CHANNEL_EVERY_MINUTES=30s
```

## Find Format Time
- Examples 1h, 30s, 45m, 1.5 hours etc.
- For more see: https://github.com/jmettraux/rufus-scheduler

## Usage Service From Console
```
 e = Emoji::EmojiService.new
 emoji = e.call

 t = Telegram::SendMessageToChannelService.new('your-channel-url-name', emoji)
 t.call
```


Created by [Henry Mendez - 7Mendez](https://github.com/7Mendez)
