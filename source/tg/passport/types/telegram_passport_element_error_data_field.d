/**
 * Contains TelegramPassportElementErrorDataField
 */
module tg.passport.types.telegram_passport_element_error_data_field;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field's value changes.
 */
class TelegramPassportElementErrorDataField : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _source = "";
        _type = "";
        _field_name = "";
        _data_hash = "";
        _message = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "source" !in data ) throw new TelegramException("Could not find reqired entry : source");
        _source = data["source"].str();

        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "field_name" !in data ) throw new TelegramException("Could not find reqired entry : field_name");
        _field_name = data["field_name"].str();

        if ( "data_hash" !in data ) throw new TelegramException("Could not find reqired entry : data_hash");
        _data_hash = data["data_hash"].str();

        if ( "message" !in data ) throw new TelegramException("Could not find reqired entry : message");
        _message = data["message"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["source"] = _source;

        data["type"] = _type;

        data["field_name"] = _field_name;

        data["data_hash"] = _data_hash;

        data["message"] = _message;

        return data;
    }

    /** Error source, must be <em>data</em> */
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

    /** The section of the user's Telegram Passport which has the error, one of &#8220;personal_details&#8221;, &#8220;passport&#8221;, &#8220;driver_license&#8221;, &#8220;identity_card&#8221;, &#8220;internal_passport&#8221;, &#8220;address&#8221; */
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

    /** Name of the data field which has the error */
    private string _field_name;
    /**
     * Getter for '_field_name'
     * Returns: Current value of '_field_name'
     */
    @property string fieldName () { return _field_name; }
    /**
     * Setter for '_field_name'
     * Params: fieldNameNew = New value of '_field_name'
     * Returns: New value of '_field_name'
     */
    @property string fieldName ( string fieldNameNew ) { return _field_name = fieldNameNew; }

    /** Base64-encoded data hash */
    private string _data_hash;
    /**
     * Getter for '_data_hash'
     * Returns: Current value of '_data_hash'
     */
    @property string dataHash () { return _data_hash; }
    /**
     * Setter for '_data_hash'
     * Params: dataHashNew = New value of '_data_hash'
     * Returns: New value of '_data_hash'
     */
    @property string dataHash ( string dataHashNew ) { return _data_hash = dataHashNew; }

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

