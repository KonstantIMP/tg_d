/**
 * Contains TelegramInlineQuery
 */
module tg.inline.types.telegram_inline_query;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results.
 */
class TelegramInlineQuery : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _id = "";
        _from = null;
        _query = "";
        _offset = "";
        _chat_type = "";
        _location = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "from" !in data ) throw new TelegramException("Could not find reqired entry : from");
        _from = new TelegramUser(data["from"]);

        if ( "query" !in data ) throw new TelegramException("Could not find reqired entry : query");
        _query = data["query"].str();

        if ( "offset" !in data ) throw new TelegramException("Could not find reqired entry : offset");
        _offset = data["offset"].str();

        if ( "chat_type" in data )
        _chat_type = data["chat_type"].str();

        if ( "location" in data )
        _location = new TelegramLocation(data["location"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["id"] = _id;

        data["from"] = _from.getAsJson();

        data["query"] = _query;

        data["offset"] = _offset;

        if ( _chat_type != "" ) data["chat_type"] = _chat_type;

        if ( _location !is null ) data["location"] = _location.getAsJson();

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

    /** Text of the query (up to 256 characters) */
    private string _query;
    /**
     * Getter for '_query'
     * Returns: Current value of '_query'
     */
    @property string query () { return _query; }
    /**
     * Setter for '_query'
     * Params: queryNew = New value of '_query'
     * Returns: New value of '_query'
     */
    @property string query ( string queryNew ) { return _query = queryNew; }

    /** Offset of the results to be returned, can be controlled by the bot */
    private string _offset;
    /**
     * Getter for '_offset'
     * Returns: Current value of '_offset'
     */
    @property string offset () { return _offset; }
    /**
     * Setter for '_offset'
     * Params: offsetNew = New value of '_offset'
     * Returns: New value of '_offset'
     */
    @property string offset ( string offsetNew ) { return _offset = offsetNew; }

    /** <em>Optional</em>. Type of the chat, from which the inline query was sent. Can be either &#8220;sender&#8221; for a private chat with the inline query sender, &#8220;private&#8221;, &#8220;group&#8221;, &#8220;supergroup&#8221;, or &#8220;channel&#8221;. The chat type should be always known for requests sent from official clients and most third-party clients, unless the request was sent from a secret chat */
    private string _chat_type;
    /**
     * Getter for '_chat_type'
     * Returns: Current value of '_chat_type'
     */
    @property string chatType () { return _chat_type; }
    /**
     * Setter for '_chat_type'
     * Params: chatTypeNew = New value of '_chat_type'
     * Returns: New value of '_chat_type'
     */
    @property string chatType ( string chatTypeNew ) { return _chat_type = chatTypeNew; }

    /** <em>Optional</em>. Sender location, only for bots that request user location */
    private TelegramLocation _location;
    /**
     * Getter for '_location'
     * Returns: Current value of '_location'
     */
    @property TelegramLocation location () { return _location; }
    /**
     * Setter for '_location'
     * Params: locationNew = New value of '_location'
     * Returns: New value of '_location'
     */
    @property TelegramLocation location ( TelegramLocation locationNew ) { return _location = locationNew; }
}

