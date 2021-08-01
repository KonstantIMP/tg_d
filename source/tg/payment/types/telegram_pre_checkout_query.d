/**
 * Contains TelegramPreCheckoutQuery
 */
module tg.payment.types.telegram_pre_checkout_query;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object contains information about an incoming pre-checkout query.
 */
class TelegramPreCheckoutQuery : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _id = "";
        _from = null;
        _currency = "";
        _total_amount = 0;
        _invoice_payload = "";
        _shipping_option_id = "";
        _order_info = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "from" !in data ) throw new TelegramException("Could not find reqired entry : from");
        _from = new TelegramUser(data["from"]);

        if ( "currency" !in data ) throw new TelegramException("Could not find reqired entry : currency");
        _currency = data["currency"].str();

        if ( "total_amount" !in data ) throw new TelegramException("Could not find reqired entry : total_amount");
        _total_amount = data["total_amount"].integer();

        if ( "invoice_payload" !in data ) throw new TelegramException("Could not find reqired entry : invoice_payload");
        _invoice_payload = data["invoice_payload"].str();

        if ( "shipping_option_id" in data )
        _shipping_option_id = data["shipping_option_id"].str();

        if ( "order_info" in data )
        _order_info = new TelegramOrderInfo(data["order_info"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["id"] = _id;

        data["from"] = _from.getAsJson();

        data["currency"] = _currency;

        data["total_amount"] = _total_amount;

        data["invoice_payload"] = _invoice_payload;

        if ( _shipping_option_id != "" ) data["shipping_option_id"] = _shipping_option_id;

        if ( _order_info !is null ) data["order_info"] = _order_info.getAsJson();

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

    /** Three-letter ISO 4217 currency code */
    private string _currency;
    /**
     * Getter for '_currency'
     * Returns: Current value of '_currency'
     */
    @property string currency () { return _currency; }
    /**
     * Setter for '_currency'
     * Params: currencyNew = New value of '_currency'
     * Returns: New value of '_currency'
     */
    @property string currency ( string currencyNew ) { return _currency = currencyNew; }

    /** Total price in the <em>smallest units</em> of the currency (integer, <strong>not</strong> float/double). For example, for a price of <code>US$ 1.45</code> pass <code>amount = 145</code>. See the <em>exp</em> parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). */
    private ulong _total_amount;
    /**
     * Getter for '_total_amount'
     * Returns: Current value of '_total_amount'
     */
    @property ulong totalAmount () { return _total_amount; }
    /**
     * Setter for '_total_amount'
     * Params: totalAmountNew = New value of '_total_amount'
     * Returns: New value of '_total_amount'
     */
    @property ulong totalAmount ( ulong totalAmountNew ) { return _total_amount = totalAmountNew; }

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

    /** <em>Optional</em>. Identifier of the shipping option chosen by the user */
    private string _shipping_option_id;
    /**
     * Getter for '_shipping_option_id'
     * Returns: Current value of '_shipping_option_id'
     */
    @property string shippingOptionId () { return _shipping_option_id; }
    /**
     * Setter for '_shipping_option_id'
     * Params: shippingOptionIdNew = New value of '_shipping_option_id'
     * Returns: New value of '_shipping_option_id'
     */
    @property string shippingOptionId ( string shippingOptionIdNew ) { return _shipping_option_id = shippingOptionIdNew; }

    /** <em>Optional</em>. Order info provided by the user */
    private TelegramOrderInfo _order_info;
    /**
     * Getter for '_order_info'
     * Returns: Current value of '_order_info'
     */
    @property TelegramOrderInfo orderInfo () { return _order_info; }
    /**
     * Setter for '_order_info'
     * Params: orderInfoNew = New value of '_order_info'
     * Returns: New value of '_order_info'
     */
    @property TelegramOrderInfo orderInfo ( TelegramOrderInfo orderInfoNew ) { return _order_info = orderInfoNew; }
}

