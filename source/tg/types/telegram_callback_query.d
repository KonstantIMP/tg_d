/**
 * Contains TelegramCallbackQuery
 */
module tg.types.telegram_callback_query;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field <em>message</em> will be present. If the button was attached to a message sent via the bot (in inline mode), the field <em>inline_message_id</em> will be present. Exactly one of the fields <em>data</em> or <em>game_short_name</em> will be present.
 */
class TelegramCallbackQuery : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _id = "";
        _from = null;
        _message = null;
        _inline_message_id = "";
        _chat_instance = "";
        _data = "";
        _game_short_name = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "from" !in data ) throw new TelegramException("Could not find reqired entry : from");
        _from = new TelegramUser(data["from"]);

        if ( "message" in data )
        _message = new TelegramMessage(data["message"]);

        if ( "inline_message_id" in data )
        _inline_message_id = data["inline_message_id"].str();

        if ( "chat_instance" !in data ) throw new TelegramException("Could not find reqired entry : chat_instance");
        _chat_instance = data["chat_instance"].str();

        if ( "data" in data )
        _data = data["data"].str();

        if ( "game_short_name" in data )
        _game_short_name = data["game_short_name"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["id"] = _id;

        data["from"] = _from.getAsJson();

        if ( _message !is null ) data["message"] = _message.getAsJson();

        if ( _inline_message_id != "" ) data["inline_message_id"] = _inline_message_id;

        data["chat_instance"] = _chat_instance;

        if ( _data != "" ) data["data"] = _data;

        if ( _game_short_name != "" ) data["game_short_name"] = _game_short_name;

        return data;
    }

    /** Unique identifier for this query */
    private string _id;
    /**
     * Getter for '_id'
     * Returns: Current value of '_id'
     */
    @property string id () { return _id; }
    /**
     * Setter for '_id'
     * Params: idNew = New value of '_id'
     * Returns: New value of '_id'
     */
    @property string id ( string idNew ) { return _id = idNew; }

    /** Sender */
    private TelegramUser _from;
    /**
     * Getter for '_from'
     * Returns: Current value of '_from'
     */
    @property TelegramUser from () { return _from; }
    /**
     * Setter for '_from'
     * Params: fromNew = New value of '_from'
     * Returns: New value of '_from'
     */
    @property TelegramUser from ( TelegramUser fromNew ) { return _from = fromNew; }

    /** <em>Optional</em>. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old */
    private TelegramMessage _message;
    /**
     * Getter for '_message'
     * Returns: Current value of '_message'
     */
    @property TelegramMessage message () { return _message; }
    /**
     * Setter for '_message'
     * Params: messageNew = New value of '_message'
     * Returns: New value of '_message'
     */
    @property TelegramMessage message ( TelegramMessage messageNew ) { return _message = messageNew; }

    /** <em>Optional</em>. Identifier of the message sent via the bot in inline mode, that originated the query. */
    private string _inline_message_id;
    /**
     * Getter for '_inline_message_id'
     * Returns: Current value of '_inline_message_id'
     */
    @property string inlineMessageId () { return _inline_message_id; }
    /**
     * Setter for '_inline_message_id'
     * Params: inlineMessageIdNew = New value of '_inline_message_id'
     * Returns: New value of '_inline_message_id'
     */
    @property string inlineMessageId ( string inlineMessageIdNew ) { return _inline_message_id = inlineMessageIdNew; }

    /** Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games. */
    private string _chat_instance;
    /**
     * Getter for '_chat_instance'
     * Returns: Current value of '_chat_instance'
     */
    @property string chatInstance () { return _chat_instance; }
    /**
     * Setter for '_chat_instance'
     * Params: chatInstanceNew = New value of '_chat_instance'
     * Returns: New value of '_chat_instance'
     */
    @property string chatInstance ( string chatInstanceNew ) { return _chat_instance = chatInstanceNew; }

    /** <em>Optional</em>. Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field. */
    private string _data;
    /**
     * Getter for '_data'
     * Returns: Current value of '_data'
     */
    @property string data () { return _data; }
    /**
     * Setter for '_data'
     * Params: dataNew = New value of '_data'
     * Returns: New value of '_data'
     */
    @property string data ( string dataNew ) { return _data = dataNew; }

    /** <em>Optional</em>. Short name of a Game to be returned, serves as the unique identifier for the game */
    private string _game_short_name;
    /**
     * Getter for '_game_short_name'
     * Returns: Current value of '_game_short_name'
     */
    @property string gameShortName () { return _game_short_name; }
    /**
     * Setter for '_game_short_name'
     * Params: gameShortNameNew = New value of '_game_short_name'
     * Returns: New value of '_game_short_name'
     */
    @property string gameShortName ( string gameShortNameNew ) { return _game_short_name = gameShortNameNew; }
}

