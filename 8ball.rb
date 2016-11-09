# coding: UTF-8
require 'telegram/bot'

TOKEN = '289235041:AAH6QcaNCTm01j6P1IZ_47HNLN6dRCdcYY0'

ANSWERS = [
  # Положительные
  "Бесспорно",
  "Предрешено",
  "Никаких сомнений",
  "Определённо да",
  "Точно да",

  # Нерешительно положительные
  "Мне кажется — «да»",
  "Вероятнее всего",
  "Хорошие перспективы",
  "Знаки говорят — «да»",
  "Да",

  # Нейтральные
  "Пока не ясно, попробуй снова",
  "Спроси позже",
  "Лучше не рассказывать",
  "Сейчас нельзя предсказать",
  "Сконцентрируйся и спроси опять",

  # Отрицательные
  "Даже не думай",
  "Мой ответ — «нет»",
  "По моим данным — «нет»",
  "Перспективы не очень хорошие",
  "Весьма сомнительно"
]

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
      when '/start', '/start start'
        bot.api.send_message(
                   chat_id: message.chat.id,
                   text: "Здравствуй, #{message.from.first_name}"
        )
      else
        bot.api.send_message(
                   chat_id: message.chat.id,
                   text: ANSWERS.sample
        )
    end
  end
end