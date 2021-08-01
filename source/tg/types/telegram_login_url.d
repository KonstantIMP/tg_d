/**
 * Contains TelegramLoginUrl
 */
module tg.types.telegram_login_url;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a parameter of the inline keyboard button used to automatically authorize a user.
 */
class TelegramLoginUrl : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _url = "";
        _forward_text = "";
        _bot_username = "";
        _request_write_access = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "url" !in data ) throw new TelegramException("Could not find reqired entry : url");
        _url = data["url"].str();

        if ( "forward_text" in data )
        _forward_text = data["forward_text"].str();

        if ( "bot_username" in data )
        _bot_username = data["bot_username"].str();

        if ( "request_write_access" in data )
        _request_write_access = data["request_write_access"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["url"] = _url;

        if ( _forward_text != "" ) data["forward_text"] = _forward_text;

        if ( _bot_username != "" ) data["bot_username"] = _bot_username;

        data["request_write_access"] = _request_write_access;

        return data;
    }

    /** An HTTP URL to be opened with user authorization data added to the query string when the button is pressed */
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

    /** Optional. New text of the button in forwarded messages. */
    private string _forward_text;
    /**
     * Getter for '_forward_text'
     * Returns: Current value of '_forward_text'
     */
    @property string forwardText () { return _forward_text; }
    /**
     * Setter for '_forward_text'
     * Params: forwardTextNew = New value of '_forward_text'
     * Returns: New value of '_forward_text'
     */
    @property string forwardText ( string forwardTextNew ) { return _forward_text = forwardTextNew; }

    /** Optional. Username of a bot, which will be used for user authorization */
    private string _bot_username;
    /**
     * Getter for '_bot_username'
     * Returns: Current value of '_bot_username'
     */
    @property string botUsername () { return _bot_username; }
    /**
     * Setter for '_bot_username'
     * Params: botUsernameNew = New value of '_bot_username'
     * Returns: New value of '_bot_username'
     */
    @property string botUsername ( string botUsernameNew ) { return _bot_username = botUsernameNew; }

    /** Optional. Pass True to request the permission for your bot to send messages to the user. */
    private bool _request_write_access;
    /**
     * Getter for '_request_write_access'
     * Returns: Current value of '_request_write_access'
     */
    @property bool requestWriteAccess () { return _request_write_access; }
    /**
     * Setter for '_request_write_access'
     * Params: requestWriteAccessNew = New value of '_request_write_access'
     * Returns: New value of '_request_write_access'
     */
    @property bool requestWriteAccess ( bool requestWriteAccessNew ) { return _request_write_access = requestWriteAccessNew; }
}

