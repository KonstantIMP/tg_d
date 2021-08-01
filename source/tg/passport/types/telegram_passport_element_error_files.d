/**
 * Contains TelegramPassportElementErrorFiles
 */
module tg.passport.types.telegram_passport_element_error_files;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes.
 */
class TelegramPassportElementErrorFiles : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _source = "";
        _type = "";
        _file_hashes = "";
        _message = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "source" !in data ) throw new TelegramException("Could not find reqired entry : source");
        _source = data["source"].str();

        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "file_hashes" !in data ) throw new TelegramException("Could not find reqired entry : file_hashes");
        _file_hashes = data["file_hashes"].str();

        if ( "message" !in data ) throw new TelegramException("Could not find reqired entry : message");
        _message = data["message"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["source"] = _source;

        data["type"] = _type;

        data["file_hashes"] = _file_hashes;

        data["message"] = _message;

        return data;
    }

    /** Error source, must be <em>files</em> */
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

    /** The section of the user's Telegram Passport which has the issue, one of &#8220;utility_bill&#8221;, &#8220;bank_statement&#8221;, &#8220;rental_agreement&#8221;, &#8220;passport_registration&#8221;, &#8220;temporary_registration&#8221; */
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

    /** List of base64-encoded file hashes */
    private string _file_hashes;
    /**
     * Getter for '_file_hashes'
     * Returns: Current value of '_file_hashes'
     */
    @property string fileHashes () { return _file_hashes; }
    /**
     * Setter for '_file_hashes'
     * Params: fileHashesNew = New value of '_file_hashes'
     * Returns: New value of '_file_hashes'
     */
    @property string fileHashes ( string fileHashesNew ) { return _file_hashes = fileHashesNew; }

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

