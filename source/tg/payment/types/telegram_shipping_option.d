/**
 * Contains TelegramShippingOption
 */
module tg.payment.types.telegram_shipping_option;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents one shipping option.
 */
class TelegramShippingOption : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _id = "";
        _title = "";
        _prices = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "title" !in data ) throw new TelegramException("Could not find reqired entry : title");
        _title = data["title"].str();

        if ( "prices" !in data ) throw new TelegramException("Could not find reqired entry : prices");
        _prices = new TelegramLabeledPrice(data["prices"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["id"] = _id;

        data["title"] = _title;

        data["prices"] = _prices.getAsJson();

        return data;
    }

    /** Shipping option identifier */
    private string _id;
    /**
     * Getter for '_id'
     * Returns: Current value of '_id'
     */
    @property string id () { return _id; }
    /**
     * Setter for '_id'
     * Params: idNew = New value of '_id'
     * Returns: New value of '_id'
     */
    @property string id ( string idNew ) { return _id = idNew; }

    /** Option title */
    private string _title;
    /**
     * Getter for '_title'
     * Returns: Current value of '_title'
     */
    @property string title () { return _title; }
    /**
     * Setter for '_title'
     * Params: titleNew = New value of '_title'
     * Returns: New value of '_title'
     */
    @property string title ( string titleNew ) { return _title = titleNew; }

    /** List of price portions */
    private TelegramLabeledPrice _prices;
    /**
     * Getter for '_prices'
     * Returns: Current value of '_prices'
     */
    @property TelegramLabeledPrice prices () { return _prices; }
    /**
     * Setter for '_prices'
     * Params: pricesNew = New value of '_prices'
     * Returns: New value of '_prices'
     */
    @property TelegramLabeledPrice prices ( TelegramLabeledPrice pricesNew ) { return _prices = pricesNew; }
}

