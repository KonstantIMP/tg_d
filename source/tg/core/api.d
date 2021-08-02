/** 
 * Standart bot`s method
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: 1 Aug 2021
 */
module tg.core.api;

/** Import tg core */
import tg.core.type, tg.core.exception, tg.type;
/** Import JSON lib */
import std.json;

/** 
 * Standart method for import to the TelegramVot
 */
mixin template CoreBotApi () {
    /** 
     * Get information abot bot
     * Throws: Telegram exception if the user is not a bot
     * Returns: Information abot the bot
     */
    public TelegramUser getMe () {
        TelegramUser result = execute!(TelegramUser)("getMe");

        if (result.isBot == false)
            throw new TelegramException ("Cannot authorize bot : it is not bot");

        return result;
    }

    /** 
     * Use this method to log out from the cloud Bot API server before launching the bot locally
     * Returns: True on success
     */
    public bool logOut () {
        return execute("logOut").boolean();
    }

    /** 
     * Use this method to close the bot instance before moving it from one local server to another.
     * Returns: True on success
     */
    public bool close () {
        return execute("close").boolean();
    }

    /** 
     * Use this method to send text messages
     * Params:
     *   chat = Unique identifier for the target chat or username of the target channel
     *   text = Text of the message to be sent
     *   parse = Mode for parsing entities in the message text
     *   entities = List of special entities that appear in message text, which can be specified instead of parse_mode
     *   disableWebPagePreview = Disables link previews for links in this message
     *   disableNotification = Sends the message silently.
     *   replyToMessageId = If the message is a reply, ID of the original message
     *   allowSendingWithoutReply = Pass True, if the message should be sent even if the specified replied-to message is not found
     *   replyMarkup = Additional interface options
     * Returns: On success, the sent Message is returned
     */
    public TelegramMessage sendMessage (T, U)  (T chat,
                                                string text,
                                                TextFormat parse = TextFormat.None,
                                                TelegramMessageEntity [] entities = null,
                                                bool disableWebPagePreview = false,
                                                bool disableNotification = false,
                                                ulong replyToMessageId = 0,
                                                bool allowSendingWithoutReply = false,
                                                U replyMarkup = null) if ((is (T == ulong) || is (T == string)) && (is (U == TelegramInlineKeyboardMarkup) || is (U == TelegramReplyKeyboardMarkup) || is (U == TelegramReplyKeyboardRemove) || is (U == TelegramForceReply) || is (U == typeof(null)))) {
        JSONValue request = parseJSON("");

        request["chat_id"] = chat;
        request["text"] = text;
        if (parse != TextFormat.None) request["parse_mode"] = parse;
        if (entities !is null) request["entities"] = entities.getAsJson();
        request["disable_web_page_preview"] = disableWebPagePreview;
        request["disable_notification"] = disableNotification;
        if (replyToMessageId) request["reply_to_message_id"] = replyToMessageId;
        request["allow_sending_without_reply"] = allowSendingWithoutReply;
        if (replyMarkup !is null) request["reply_markup"] = replyMarkup.getAsJson();

        return execute!TelegramMessage("sendMessage", request);
    }
}