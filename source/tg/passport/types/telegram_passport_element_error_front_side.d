/**
 * Contains TelegramPassportElementErrorFrontSide
 */
module tg.passport.types.telegram_passport_element_error_front_side;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents an issue with the front side of a document. The error is considered resolved when the file with the front side of the document changes.
 */
class TelegramPassportElementErrorFrontSide : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _source = "";
        _type = "";
        _file_hash = "";
        _message = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "source" !in data ) throw new TelegramException("Could not find reqired entry : source");
        _source = data["source"].str();

        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "file_hash" !in data ) throw new TelegramException("Could not find reqired entry : file_hash");
        _file_hash = data["file_hash"].str();

        if ( "message" !in data ) throw new TelegramException("Could not find reqired entry : message");
        _message = data["message"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["source"] = _source;

        data["type"] = _type;

        data["file_hash"] = _file_hash;

        data["message"] = _message;

        return data;
    }

    /** Error source, must be <em>front_side</em> */
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

    /** The section of the user's Telegram Passport which has the issue, one of &#8220;passport&#8221;, &#8220;driver_license&#8221;, &#8220;identity_card&#8221;, &#8220;internal_passport&#8221; */
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

    /** Base64-encoded hash of the file with the front side of the document */
    private string _file_hash;
    /**
     * Getter for '_file_hash'
     * Returns: Current value of '_file_hash'
     */
    @property string fileHash () { return _file_hash; }
    /**
     * Setter for '_file_hash'
     * Params: fileHashNew = New value of '_file_hash'
     * Returns: New value of '_file_hash'
     */
    @property string fileHash ( string fileHashNew ) { return _file_hash = fileHashNew; }

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

