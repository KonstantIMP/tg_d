/**
 * Contains TelegramShippingAddress
 */
module tg.payment.types.telegram_shipping_address;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a shipping address.
 */
class TelegramShippingAddress : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _country_code = "";
        _state = "";
        _city = "";
        _street_line1 = "";
        _street_line2 = "";
        _post_code = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "country_code" !in data ) throw new TelegramException("Could not find reqired entry : country_code");
        _country_code = data["country_code"].str();

        if ( "state" !in data ) throw new TelegramException("Could not find reqired entry : state");
        _state = data["state"].str();

        if ( "city" !in data ) throw new TelegramException("Could not find reqired entry : city");
        _city = data["city"].str();

        if ( "street_line1" !in data ) throw new TelegramException("Could not find reqired entry : street_line1");
        _street_line1 = data["street_line1"].str();

        if ( "street_line2" !in data ) throw new TelegramException("Could not find reqired entry : street_line2");
        _street_line2 = data["street_line2"].str();

        if ( "post_code" !in data ) throw new TelegramException("Could not find reqired entry : post_code");
        _post_code = data["post_code"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["country_code"] = _country_code;

        data["state"] = _state;

        data["city"] = _city;

        data["street_line1"] = _street_line1;

        data["street_line2"] = _street_line2;

        data["post_code"] = _post_code;

        return data;
    }

    /** ISO 3166-1 alpha-2 country code */
    private string _country_code;
    /**
     * Getter for '_country_code'
     * Returns: Current value of '_country_code'
     */
    @property string countryCode () { return _country_code; }
    /**
     * Setter for '_country_code'
     * Params: countryCodeNew = New value of '_country_code'
     * Returns: New value of '_country_code'
     */
    @property string countryCode ( string countryCodeNew ) { return _country_code = countryCodeNew; }

    /** State, if applicable */
    private string _state;
    /**
     * Getter for '_state'
     * Returns: Current value of '_state'
     */
    @property string state () { return _state; }
    /**
     * Setter for '_state'
     * Params: stateNew = New value of '_state'
     * Returns: New value of '_state'
     */
    @property string state ( string stateNew ) { return _state = stateNew; }

    /** City */
    private string _city;
    /**
     * Getter for '_city'
     * Returns: Current value of '_city'
     */
    @property string city () { return _city; }
    /**
     * Setter for '_city'
     * Params: cityNew = New value of '_city'
     * Returns: New value of '_city'
     */
    @property string city ( string cityNew ) { return _city = cityNew; }

    /** First line for the address */
    private string _street_line1;
    /**
     * Getter for '_street_line1'
     * Returns: Current value of '_street_line1'
     */
    @property string streetLine1 () { return _street_line1; }
    /**
     * Setter for '_street_line1'
     * Params: streetLine1New = New value of '_street_line1'
     * Returns: New value of '_street_line1'
     */
    @property string streetLine1 ( string streetLine1New ) { return _street_line1 = streetLine1New; }

    /** Second line for the address */
    private string _street_line2;
    /**
     * Getter for '_street_line2'
     * Returns: Current value of '_street_line2'
     */
    @property string streetLine2 () { return _street_line2; }
    /**
     * Setter for '_street_line2'
     * Params: streetLine2New = New value of '_street_line2'
     * Returns: New value of '_street_line2'
     */
    @property string streetLine2 ( string streetLine2New ) { return _street_line2 = streetLine2New; }

    /** Address post code */
    private string _post_code;
    /**
     * Getter for '_post_code'
     * Returns: Current value of '_post_code'
     */
    @property string postCode () { return _post_code; }
    /**
     * Setter for '_post_code'
     * Params: postCodeNew = New value of '_post_code'
     * Returns: New value of '_post_code'
     */
    @property string postCode ( string postCodeNew ) { return _post_code = postCodeNew; }
}

