/**
 * Contains TelegramPassportElementErrorUnspecified
 */
module tg.passport.types.telegram_passport_element_error_unspecified;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents an issue in an unspecified place. The error is considered resolved when new data is added.
 */
class TelegramPassportElementErrorUnspecified : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _source = "";
        _type = "";
        _element_hash = "";
        _message = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "source" !in data ) throw new TelegramException("Could not find reqired entry : source");
        _source = data["source"].str();

        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "element_hash" !in data ) throw new TelegramException("Could not find reqired entry : element_hash");
        _element_hash = data["element_hash"].str();

        if ( "message" !in data ) throw new TelegramException("Could not find reqired entry : message");
        _message = data["message"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["source"] = _source;

        data["type"] = _type;

        data["element_hash"] = _element_hash;

        data["message"] = _message;

        return data;
    }

    /** Error source, must be <em>unspecified</em> */
    private string _source;
    /**
     * Getter for '_source'
     * Returns: Current value of '_source'
     */
    @property string source () { return _source; }
    /**
     * Setter for '_source'
     * Params: sourceNew = New value of '_source'
     * Returns: New value of '_source'
     */
    @property string source ( string sourceNew ) { return _source = sourceNew; }

    /** Type of element of the user's Telegram Passport which has the issue */
    private string _type;
    /**
     * Getter for '_type'
     * Returns: Current value of '_type'
     */
    @property string type () { return _type; }
    /**
     * Setter for '_type'
     * Params: typeNew = New value of '_type'
     * Returns: New value of '_type'
     */
    @property string type ( string typeNew ) { return _type = typeNew; }

    /** Base64-encoded element hash */
    private string _element_hash;
    /**
     * Getter for '_element_hash'
     * Returns: Current value of '_element_hash'
     */
    @property string elementHash () { return _element_hash; }
    /**
     * Setter for '_element_hash'
     * Params: elementHashNew = New value of '_element_hash'
     * Returns: New value of '_element_hash'
     */
    @property string elementHash ( string elementHashNew ) { return _element_hash = elementHashNew; }

    /** Error message */
    private string _message;
    /**
     * Getter for '_message'
     * Returns: Current value of '_message'
     */
    @property string message () { return _message; }
    /**
     * Setter for '_message'
     * Params: messageNew = New value of '_message'
     * Returns: New value of '_message'
     */
    @property string message ( string messageNew ) { return _message = messageNew; }
}

