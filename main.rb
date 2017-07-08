require '../telegram_bot_translate/api_key.rb'
require 'telegram/bot'
require 'easy_translate'

# API key Google Translate https://console.developers.google.com
EasyTranslate.api_key = $token_google

# API key Telegram bot BotFather
Telegram::Bot::Client.run($token_telegram) do |bot|
  bot.listen do |message|
        bot.api.send_message(chat_id: message.chat.id, text: EasyTranslate.translate( message.text, :to => :english ))
  end
end
