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

    /** 
     * Use this method to forward messages of any kind
     * Params:
     *   id = Unique identifier for the target chat or username of the target channel
     *   fromId = Unique identifier for the chat where the original message was sent 
     *   msgId = Sends the message silently
     *   disableNotification = Message identifier in the chat specified in from_chat_id
     * Returns: On success, the sent Message is returned.
     */
    public TelegramMessage forwardMessage (T, U) (T id,
                                                  U fromId,
                                                  ulong msgId,
                                                  bool disableNotification = false) if ((is (T == string) || is (T == ulong)) && (is (U == ulong) || is (U == string))) {
        JSONValue request = parseJSON("");

        request["chat_id"] = id;
        request["from_chat_id"] = fromId;
        request["disable_notification"] = disableNotification;
        request["message_id"] = msgId;

        return execute!TelegramMessage("forwardMessage", request);
    }

    /** 
     * Use this method to copy messages of any kind
     * Params:
     *   id = Unique identifier for the target chat or username of the target channel
     *   fromId = Unique identifier for the chat where the original message was sent 
     *   msgId = Message identifier in the chat specified in from_chat_id
     *   caption = New caption for media, 0-1024 characters after entities parsing. If not specified, the original caption is kept
     *   entities = List of special entities that appear in the new caption, which can be specified instead of parse_mode
     *   disableNotification = Sends the message silently
     *   replyToMessageId = If the message is a reply, ID of the original message
     *   allowSendingWithoutReply = Pass True, if the message should be sent even if the specified replied-to message is not found
     *   replyMarkup = Additional interface options
     * Returns: 
     */
    public TelegramMessage copyMessage (T, U, I) (T id,
                                                  U fromId,
                                                  ulong msgId,
                                                  string caption = "",
                                                  TelegramMessageEntity [] entities = null,
                                                  bool disableNotification = false,
                                                  ulong replyToMessageId = 0,
                                                  bool allowSendingWithoutReply = false,
                                                  I replyMarkup = null) if ((is (T == ulong) || is (T == string)) && (is (U == ulong) || is (U == string)) && (is (I == TelegramInlineKeyboardMarkup) || is (I == TelegramReplyKeyboardMarkup) || is (I == TelegramReplyKeyboardRemove) || is (I == TelegramForceReply) || is (I == typeof(null)))) {
        JSONValue request = parseJSON("");

        request["chat_id"] = id;
        request["from_chat_id"] = fromId;
        request["disable_notification"] = disableNotification;
        request["message_id"] = msgId;
        if (parse != TextFormat.None) request["parse_mode"] = parse;
        if (entities !is null) request["caption_entities"] = entities.getAsJson();
        if (caption != "") request["caption"] = caption;
        if (replyToMessageId) request["reply_to_message_id"] = replyToMessageId;
        request["allow_sending_without_reply"] = allowSendingWithoutReply;
        if (replyMarkup !is null) request["reply_markup"] = replyMarkup.getAsJson();

        return execute!TelegramMessage("copyMessage", request);
    }

    /** 
     * Use this method to send photos.
     * Params:
     *   id = Unique identifier for the target chat or username of the target channe
     *   photo = Photo to send
     *   caption = Photo caption
     *   parse = Mode for parsing entities in the photo caption
     *   entities = List of special entities that appear in the caption
     *   disableNotification = Sends the message silently.
     *   replyToMessageId = If the message is a reply, ID of the original message
     *   allowSendingWithoutReply = Pass True,
     *   replyMarkup = 	Additional interface options.
     * Returns: On success, the sent Message is returned
     */
    public TelegramMessage sendPhoto (T, U) (T id,
                                             TelegramInputFile photo,
                                             string caption = "",
                                             TextFormat parse = TextFormat.None,
                                             TelegramMessageEntity [] entities = null,
                                             bool disableNotification = false,
                                             ulong replyToMessageId = 0,
                                             bool allowSendingWithoutReply = false,
                                             U replyMarkup = null) if ((is (T == ulong) || is (T == string)) && (is (U == TelegramInlineKeyboardMarkup) || is (U == TelegramReplyKeyboardMarkup) || is (U == TelegramReplyKeyboardRemove) || is (U == TelegramForceReply) || is (U == typeof(null)))) {
        MultipartForm request;

        request.add(formData ("chat_id", to!string(id)));
        
        if (photo.type == InputFileType.LocalFile) { 
            import std.file : DirEntry;
            auto img = DirEntry(photo.getAsJson().str());
            request.add(formData ("photo", File(photo.getAsJson().str(), "rb"), ["filename":img.name, "Content-Type": "multipart/form-data"]));
        } else request.add(formData("photo", photo.getAsJson.str(), ["Content-Type":"application/json"]));

        if (caption != "") request.add(formData ("caption", caption));
        if (parse != TextFormat.None) request.add(formData ("parse_mode", parse));
        if (entities !is null) request.add(formData("caption_entities", entities.getAsJson().toString(), ["Content-Type": "application/json"]));
        request.add(formData("disable_notification", to!string(disableNotification)));
        if (replyToMessageId) request.add(formData("reply_to_message_id", to!string(replyToMessageId)));
        request.add(formData("allow_sending_without_reply", to!string(allowSendingWithoutReply)));
        if (replyMarkup !is null) request.add(formData("reply_markup", replyMarkup.getAsJson().toString(), ["Content-Type": "application/json"]));

        return execute!TelegramMessage("sendPhoto", request);
    }

    /** 
     * Use this method to get a list of profile pictures for a user
     * Params:
     *   id = Unique identifier of the target user
     *   offset = Sequential number of the first photo to be returned
     *   limit = Limits the number of photos to be retrieved
     * Returns: Returns a UserProfilePhotos object.
     */
    public TelegramUserProfilePhotos getUserProfilePhotos (ulong id,
                                                           ulong offset = 0,
                                                           ulong limit = 100) {
        JSONValue request = parseJSON("");

        if (limit > 100 || limit < 1) throw new TelegramException("Incorrect \'limit\' : shoud be from 1 to 100");

        request["user_id"] = id;
        if (offset) request["offset"] = offset;
        request["limit"] = limit;

        return execute!TelegramUserProfilePhotos("getUserProfilePhotos", request);
    }

    /**
     * Use this method to get basic info about a file and prepare it for downloading
     * Params:
     *   id = File identifier to get info about
     * Returns: On success, a File object is returned
     */
    public TelegramFile getFile (string id) {
        JSONValue request = parseJSON("");

        request["file_id"] = id;

        return execute!TelegramFile("getFile", request);
    }

    /** 
     * Use this method to send answers to callback queries sent from inline keyboards
     * Params:
     *   id = Unique identifier for the query to be answered
     *   text = Text of the notification
     *   showAlert = If true, an alert will be shown by the client instead of a notification at the top of the chat screen
     *   url = URL that will be opened by the user's client
     *   time = The maximum amount of time in seconds that the result of the callback query may be cached client-side
     * Returns: On success, True is returned.
     */
    public bool answerCallbackQuery (string id,
                                     string text = "",
                                     bool showAlert = false,
                                     string url = "",
                                     ulong time = 0) {
        JSONValue request = parseJSON("{}");

        request["callback_query_id"] = id;
        if (text.length) request["text"] = text;
        request["show_alert"] = showAlert;
        if (url.length) request["url"] = url;
        request["cache_time"] = time;

        return execute("answerCallbackQuery", request).boolean();
    }

    /** 
     * Use this method to change the list of the bot's commands
     * Params:
     *   commands = A JSON-serialized list of bot commands to be set as the list of the bot's commands
     *   botScope = A JSON-serialized object, describing scope of users for which the commands are relevant
     *   lang = A two-letter ISO 639-1 language code
     * Returns: Returns True on success
     */
    public bool setMyCommands (TelegramBotCommand [] commands,
                               TelegramBotCommandScope botScope = null,
                               string lang = "") {
        JSONValue request = parseJSON("");

        request["commands"] = commands.getAsJson();
        if (botScope !is null) request["scope"] = botScope.getAsJson();
        if (lang.length == 2) request["language_code"] = lang;

        return execute("setMyCommands", request).boolean();
    }

    /** 
     * Use this method to delete the list of the bot's commands for the given scope and user language
     * Params:
     *   botScope = A JSON-serialized object, describing scope of users for which the commands are relevant
     *   lang = A two-letter ISO 639-1 language code
     * Returns:  Returns True on success
     */
    public bool deleteMyCommands (TelegramBotCommandScope botScope = null, string lang = "") {
        JSONValue request = parseJSON("");

        if (botScope !is null) request["scope"] = botScope.getAsJson();
        if (lang.length == 2) request["language_code"] = lang;

        return execute("deleteMyCommands", request).boolean();
    }

    /** 
     * Use this method to get the current list of the bot's commands for the given scope and user language
     * Params:
     *   botScope = A JSON-serialized object, describing scope of users.
     *   lang = A two-letter ISO 639-1 language code or an empty string
     * Returns: Returns Array of BotCommand on success
     */
    public TelegramBotCommand [] getMyCommands (TelegramBotCommandScope botScope = null, string lang = "") {
        JSONValue request = parseJSON("");

        if (botScope !is null) request["scope"] = botScope.getAsJson();
        if (lang.length == 2) request["language_code"] = lang;

        return toTelegram!TelegramBotCommand(execute("getMyCommands", request));
    }
}
