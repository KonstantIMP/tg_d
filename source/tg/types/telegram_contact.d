/**
 * Contains TelegramContact
 */
module tg.types.telegram_contact;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a phone contact.
 */
class TelegramContact : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _phone_number = "";
        _first_name = "";
        _last_name = "";
        _user_id = 0;
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

        if ( "user_id" in data )
        _user_id = data["user_id"].integer();

        if ( "vcard" in data )
        _vcard = data["vcard"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["phone_number"] = _phone_number;

        data["first_name"] = _first_name;

        if ( _last_name != "" ) data["last_name"] = _last_name;

        if ( _user_id != 0 ) data["user_id"] = _user_id;

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

    /** <em>Optional</em>. Contact's user identifier in Telegram. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. */
    private ulong _user_id;
    /**
     * Getter for '_user_id'
     * Returns: Current value of '_user_id'
     */
    @property ulong userId () { return _user_id; }
    /**
     * Setter for '_user_id'
     * Params: userIdNew = New value of '_user_id'
     * Returns: New value of '_user_id'
     */
    @property ulong userId ( ulong userIdNew ) { return _user_id = userIdNew; }

    /** <em>Optional</em>. Additional data about the contact in the form of a vCard */
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

