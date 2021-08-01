/**
 * Contains TelegramInputContactMessageContent
 */
module tg.inline.types.telegram_input_contact_message_content;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents the content of a contact message to be sent as the result of an inline query.
 */
class TelegramInputContactMessageContent : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _phone_number = "";
        _first_name = "";
        _last_name = "";
        _vcard = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "phone_number" !in data ) throw new TelegramException("Could not find reqired entry : phone_number");
        _phone_number = data["phone_number"].str();

        if ( "first_name" !in data ) throw new TelegramException("Could not find reqired entry : first_name");
        _first_name = data["first_name"].str();

        if ( "last_name" in data )
        _last_name = data["last_name"].str();

        if ( "vcard" in data )
        _vcard = data["vcard"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["phone_number"] = _phone_number;

        data["first_name"] = _first_name;

        if ( _last_name != "" ) data["last_name"] = _last_name;

        if ( _vcard != "" ) data["vcard"] = _vcard;

        return data;
    }

    /** Contact's phone number */
    private string _phone_number;
    /**
     * Getter for '_phone_number'
     * Returns: Current value of '_phone_number'
     */
    @property string phoneNumber () { return _phone_number; }
    /**
     * Setter for '_phone_number'
     * Params: phoneNumberNew = New value of '_phone_number'
     * Returns: New value of '_phone_number'
     */
    @property string phoneNumber ( string phoneNumberNew ) { return _phone_number = phoneNumberNew; }

    /** Contact's first name */
    private string _first_name;
    /**
     * Getter for '_first_name'
     * Returns: Current value of '_first_name'
     */
    @property string firstName () { return _first_name; }
    /**
     * Setter for '_first_name'
     * Params: firstNameNew = New value of '_first_name'
     * Returns: New value of '_first_name'
     */
    @property string firstName ( string firstNameNew ) { return _first_name = firstNameNew; }

    /** <em>Optional</em>. Contact's last name */
    private string _last_name;
    /**
     * Getter for '_last_name'
     * Returns: Current value of '_last_name'
     */
    @property string lastName () { return _last_name; }
    /**
     * Setter for '_last_name'
     * Params: lastNameNew = New value of '_last_name'
     * Returns: New value of '_last_name'
     */
    @property string lastName ( string lastNameNew ) { return _last_name = lastNameNew; }

    /** <em>Optional</em>. Additional data about the contact in the form of a vCard, 0-2048 bytes */
    private string _vcard;
    /**
     * Getter for '_vcard'
     * Returns: Current value of '_vcard'
     */
    @property string vcard () { return _vcard; }
    /**
     * Setter for '_vcard'
     * Params: vcardNew = New value of '_vcard'
     * Returns: New value of '_vcard'
     */
    @property string vcard ( string vcardNew ) { return _vcard = vcardNew; }
}

