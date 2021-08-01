/**
 * Contains TelegramOrderInfo
 */
module tg.payment.types.telegram_order_info;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents information about an order.
 */
class TelegramOrderInfo : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _name = "";
        _phone_number = "";
        _email = "";
        _shipping_address = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "name" in data )
        _name = data["name"].str();

        if ( "phone_number" in data )
        _phone_number = data["phone_number"].str();

        if ( "email" in data )
        _email = data["email"].str();

        if ( "shipping_address" in data )
        _shipping_address = new TelegramShippingAddress(data["shipping_address"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        if ( _name != "" ) data["name"] = _name;

        if ( _phone_number != "" ) data["phone_number"] = _phone_number;

        if ( _email != "" ) data["email"] = _email;

        if ( _shipping_address !is null ) data["shipping_address"] = _shipping_address.getAsJson();

        return data;
    }

    /** <em>Optional</em>. User name */
    private string _name;
    /**
     * Getter for '_name'
     * Returns: Current value of '_name'
     */
    @property string name () { return _name; }
    /**
     * Setter for '_name'
     * Params: nameNew = New value of '_name'
     * Returns: New value of '_name'
     */
    @property string name ( string nameNew ) { return _name = nameNew; }

    /** <em>Optional</em>. User's phone number */
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

    /** <em>Optional</em>. User email */
    private string _email;
    /**
     * Getter for '_email'
     * Returns: Current value of '_email'
     */
    @property string email () { return _email; }
    /**
     * Setter for '_email'
     * Params: emailNew = New value of '_email'
     * Returns: New value of '_email'
     */
    @property string email ( string emailNew ) { return _email = emailNew; }

    /** <em>Optional</em>. User shipping address */
    private TelegramShippingAddress _shipping_address;
    /**
     * Getter for '_shipping_address'
     * Returns: Current value of '_shipping_address'
     */
    @property TelegramShippingAddress shippingAddress () { return _shipping_address; }
    /**
     * Setter for '_shipping_address'
     * Params: shippingAddressNew = New value of '_shipping_address'
     * Returns: New value of '_shipping_address'
     */
    @property TelegramShippingAddress shippingAddress ( TelegramShippingAddress shippingAddressNew ) { return _shipping_address = shippingAddressNew; }
}

