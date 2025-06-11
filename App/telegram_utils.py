import telegram

# token account telegram
# my_token = "5923997016:AAEHpePgfXlHjjByjIRawVbF52zpG6xDy9s"
my_token = "8072642419:AAFvG4LcuEKwIHkOhOw7EssXyotDkT6kC5s"
# my_chatid = '5713943154'
my_chatid = '4650370657'

# create Bot
bot = telegram.Bot(token=my_token)

# send text message


def send_telegram(photo_path="data/alert.png"):
    try:
        bot = telegram.Bot(token=my_token)
        bot.sendPhoto(chat_id=my_chatid, photo=open(
            photo_path, "rb"), caption="Có người đang đứng ở quầy hàng!!!")
    except Exception as ex:
        print("Can not send message telegram ", ex)

    print("Send sucess")