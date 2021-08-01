/**
 * Contains TelegramChosenInlineResult
 */
module tg.inline.types.telegram_chosen_inline_result;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a result of an inline query that was chosen by the user and sent to their chat partner.
 */
class TelegramChosenInlineResult : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _result_id = "";
        _from = null;
        _location = null;
        _inline_message_id = "";
        _query = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "result_id" !in data ) throw new TelegramException("Could not find reqired entry : result_id");
        _result_id = data["result_id"].str();

        if ( "from" !in data ) throw new TelegramException("Could not find reqired entry : from");
        _from = new TelegramUser(data["from"]);

        if ( "location" in data )
        _location = new TelegramLocation(data["location"]);

        if ( "inline_message_id" in data )
        _inline_message_id = data["inline_message_id"].str();

        if ( "query" !in data ) throw new TelegramException("Could not find reqired entry : query");
        _query = data["query"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["result_id"] = _result_id;

        data["from"] = _from.getAsJson();

        if ( _location !is null ) data["location"] = _location.getAsJson();

        if ( _inline_message_id != "" ) data["inline_message_id"] = _inline_message_id;

        data["query"] = _query;

        return data;
    }

    /** The unique identifier for the result that was chosen */
    private string _result_id;
    /**
     * Getter for '_result_id'
     * Returns: Current value of '_result_id'
     */
    @property string resultId () { return _result_id; }
    /**
     * Setter for '_result_id'
     * Params: resultIdNew = New value of '_result_id'
     * Returns: New value of '_result_id'
     */
    @property string resultId ( string resultIdNew ) { return _result_id = resultIdNew; }

    /** The user that chose the result */
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

    /** <em>Optional</em>. Sender location, only for bots that require user location */
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

    /** <em>Optional</em>. Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message. */
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

    /** The query that was used to obtain the result */
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
}

