/**
 * Contains TelegramShippingQuery
 */
module tg.payment.types.telegram_shipping_query;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object contains information about an incoming shipping query.
 */
class TelegramShippingQuery : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _id = "";
        _from = null;
        _invoice_payload = "";
        _shipping_address = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "from" !in data ) throw new TelegramException("Could not find reqired entry : from");
        _from = new TelegramUser(data["from"]);

        if ( "invoice_payload" !in data ) throw new TelegramException("Could not find reqired entry : invoice_payload");
        _invoice_payload = data["invoice_payload"].str();

        if ( "shipping_address" !in data ) throw new TelegramException("Could not find reqired entry : shipping_address");
        _shipping_address = new TelegramShippingAddress(data["shipping_address"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["id"] = _id;

        data["from"] = _from.getAsJson();

        data["invoice_payload"] = _invoice_payload;

        data["shipping_address"] = _shipping_address.getAsJson();

        return data;
    }

    /** Unique query identifier */
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

    /** User who sent the query */
    private TelegramUser _from;
    /**
     * Getter for '_from'
     * Returns: Current value of '_from'
     */
    @property TelegramUser from () { return _from; }
    /**
     * Setter for '_from'
     * Params: fromNew = New value of '_from'
     * Returns: New value of '_from'
     */
    @property TelegramUser from ( TelegramUser fromNew ) { return _from = fromNew; }

    /** Bot specified invoice payload */
    private string _invoice_payload;
    /**
     * Getter for '_invoice_payload'
     * Returns: Current value of '_invoice_payload'
     */
    @property string invoicePayload () { return _invoice_payload; }
    /**
     * Setter for '_invoice_payload'
     * Params: invoicePayloadNew = New value of '_invoice_payload'
     * Returns: New value of '_invoice_payload'
     */
    @property string invoicePayload ( string invoicePayloadNew ) { return _invoice_payload = invoicePayloadNew; }

    /** User specified shipping address */
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

