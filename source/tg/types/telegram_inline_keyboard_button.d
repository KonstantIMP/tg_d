/**
 * Contains TelegramInlineKeyboardButton
 */
module tg.types.telegram_inline_keyboard_button;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents one button of an inline keyboard. You <strong>must</strong> use exactly one of the optional fields.
 */
class TelegramInlineKeyboardButton : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _text = "";
        _url = "";
        _login_url = null;
        _callback_data = "";
        _switch_inline_query = "";
        _switch_inline_query_current_chat = "";
        _callback_game = null;
        _pay = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "text" !in data ) throw new TelegramException("Could not find reqired entry : text");
        _text = data["text"].str();

        if ( "url" in data )
        _url = data["url"].str();

        if ( "login_url" in data )
        _login_url = new TelegramLoginUrl(data["login_url"]);

        if ( "callback_data" in data )
        _callback_data = data["callback_data"].str();

        if ( "switch_inline_query" in data )
        _switch_inline_query = data["switch_inline_query"].str();

        if ( "switch_inline_query_current_chat" in data )
        _switch_inline_query_current_chat = data["switch_inline_query_current_chat"].str();

        if ( "callback_game" in data )
        _callback_game = new TelegramCallbackGame(data["callback_game"]);

        if ( "pay" in data )
        _pay = data["pay"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["text"] = _text;

        if ( _url != "" ) data["url"] = _url;

        if ( _login_url !is null ) data["login_url"] = _login_url.getAsJson();

        if ( _callback_data != "" ) data["callback_data"] = _callback_data;

        if ( _switch_inline_query != "" ) data["switch_inline_query"] = _switch_inline_query;

        if ( _switch_inline_query_current_chat != "" ) data["switch_inline_query_current_chat"] = _switch_inline_query_current_chat;

        if ( _callback_game !is null ) data["callback_game"] = _callback_game.getAsJson();

        data["pay"] = _pay;

        return data;
    }

    /** Label text on the button */
    private string _text;
    /**
     * Getter for '_text'
     * Returns: Current value of '_text'
     */
    @property string text () { return _text; }
    /**
     * Setter for '_text'
     * Params: textNew = New value of '_text'
     * Returns: New value of '_text'
     */
    @property string text ( string textNew ) { return _text = textNew; }

    /** <em>Optional</em>. HTTP or tg:// url to be opened when button is pressed */
    private string _url;
    /**
     * Getter for '_url'
     * Returns: Current value of '_url'
     */
    @property string url () { return _url; }
    /**
     * Setter for '_url'
     * Params: urlNew = New value of '_url'
     * Returns: New value of '_url'
     */
    @property string url ( string urlNew ) { return _url = urlNew; }

    /** <em>Optional</em>. An HTTP URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget. */
    private TelegramLoginUrl _login_url;
    /**
     * Getter for '_login_url'
     * Returns: Current value of '_login_url'
     */
    @property TelegramLoginUrl loginUrl () { return _login_url; }
    /**
     * Setter for '_login_url'
     * Params: loginUrlNew = New value of '_login_url'
     * Returns: New value of '_login_url'
     */
    @property TelegramLoginUrl loginUrl ( TelegramLoginUrl loginUrlNew ) { return _login_url = loginUrlNew; }

    /** <em>Optional</em>. Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes */
    private string _callback_data;
    /**
     * Getter for '_callback_data'
     * Returns: Current value of '_callback_data'
     */
    @property string callbackData () { return _callback_data; }
    /**
     * Setter for '_callback_data'
     * Params: callbackDataNew = New value of '_callback_data'
     * Returns: New value of '_callback_data'
     */
    @property string callbackData ( string callbackDataNew ) { return _callback_data = callbackDataNew; }

    /** <em>Optional</em>. If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot's username and the specified inline query in the input field. Can be empty, in which case just the bot's username will be inserted.<br /><br /><strong>Note:</strong> This offers an easy way for users to start using your bot in inline mode when they are currently in a private chat with it. Especially useful when combined with <em>switch_pm&#8230;</em> actions &#8211; in this case the user will be automatically returned to the chat they switched from, skipping the chat selection screen. */
    private string _switch_inline_query;
    /**
     * Getter for '_switch_inline_query'
     * Returns: Current value of '_switch_inline_query'
     */
    @property string switchInlineQuery () { return _switch_inline_query; }
    /**
     * Setter for '_switch_inline_query'
     * Params: switchInlineQueryNew = New value of '_switch_inline_query'
     * Returns: New value of '_switch_inline_query'
     */
    @property string switchInlineQuery ( string switchInlineQueryNew ) { return _switch_inline_query = switchInlineQueryNew; }

    /** <em>Optional</em>. If set, pressing the button will insert the bot's username and the specified inline query in the current chat's input field. Can be empty, in which case only the bot's username will be inserted.<br /><br />This offers a quick way for the user to open your bot in inline mode in the same chat &#8211; good for selecting something from multiple options. */
    private string _switch_inline_query_current_chat;
    /**
     * Getter for '_switch_inline_query_current_chat'
     * Returns: Current value of '_switch_inline_query_current_chat'
     */
    @property string switchInlineQueryCurrentChat () { return _switch_inline_query_current_chat; }
    /**
     * Setter for '_switch_inline_query_current_chat'
     * Params: switchInlineQueryCurrentChatNew = New value of '_switch_inline_query_current_chat'
     * Returns: New value of '_switch_inline_query_current_chat'
     */
    @property string switchInlineQueryCurrentChat ( string switchInlineQueryCurrentChatNew ) { return _switch_inline_query_current_chat = switchInlineQueryCurrentChatNew; }

    /** <em>Optional</em>. Description of the game that will be launched when the user presses the button.<br /><br /><strong>NOTE:</strong> This type of button <strong>must</strong> always be the first button in the first row. */
    private TelegramCallbackGame _callback_game;
    /**
     * Getter for '_callback_game'
     * Returns: Current value of '_callback_game'
     */
    @property TelegramCallbackGame callbackGame () { return _callback_game; }
    /**
     * Setter for '_callback_game'
     * Params: callbackGameNew = New value of '_callback_game'
     * Returns: New value of '_callback_game'
     */
    @property TelegramCallbackGame callbackGame ( TelegramCallbackGame callbackGameNew ) { return _callback_game = callbackGameNew; }

    /** <em>Optional</em>. Specify True, to send a Pay button.<br /><br /><strong>NOTE:</strong> This type of button <strong>must</strong> always be the first button in the first row. */
    private bool _pay;
    /**
     * Getter for '_pay'
     * Returns: Current value of '_pay'
     */
    @property bool pay () { return _pay; }
    /**
     * Setter for '_pay'
     * Params: payNew = New value of '_pay'
     * Returns: New value of '_pay'
     */
    @property bool pay ( bool payNew ) { return _pay = payNew; }
}

