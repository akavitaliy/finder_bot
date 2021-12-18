require 'telegram/bot'

TOKEN = '1709419107:AAFvup9kE77uvaO6fHYZ9DoHZX0tzWQ_yUQ'

ANSWERS = [
    "да",
    "нет"
  ]

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text 
    when "/start", "/start start", "Привет", "привет", "Привет бот", "привет бот"
      bot.api.send_message( 
        chat_id: message.chat.id, 
        text: "Hello, #{message.from.first_name}" 
      )
    when '/photo'
      bot.api.send_photo(
        chat_id: message.chat.id,   
        photo: Faraday::UploadIO.new('/home/vitamin/Рабочий стол/1.png', 'image/png')
      )
    else
      bot.api.send_message( chat_id: message.chat.id, text: ANSWERS.sample )
    end
  end
end