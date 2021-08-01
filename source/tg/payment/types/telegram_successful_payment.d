/**
 * Contains TelegramSuccessfulPayment
 */
module tg.payment.types.telegram_successful_payment;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object contains basic information about a successful payment.
 */
class TelegramSuccessfulPayment : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _currency = "";
        _total_amount = 0;
        _invoice_payload = "";
        _shipping_option_id = "";
        _order_info = null;
        _telegram_payment_charge_id = "";
        _provider_payment_charge_id = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
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

        if ( "telegram_payment_charge_id" !in data ) throw new TelegramException("Could not find reqired entry : telegram_payment_charge_id");
        _telegram_payment_charge_id = data["telegram_payment_charge_id"].str();

        if ( "provider_payment_charge_id" !in data ) throw new TelegramException("Could not find reqired entry : provider_payment_charge_id");
        _provider_payment_charge_id = data["provider_payment_charge_id"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["currency"] = _currency;

        data["total_amount"] = _total_amount;

        data["invoice_payload"] = _invoice_payload;

        if ( _shipping_option_id != "" ) data["shipping_option_id"] = _shipping_option_id;

        if ( _order_info !is null ) data["order_info"] = _order_info.getAsJson();

        data["telegram_payment_charge_id"] = _telegram_payment_charge_id;

        data["provider_payment_charge_id"] = _provider_payment_charge_id;

        return data;
    }

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

    /** Telegram payment identifier */
    private string _telegram_payment_charge_id;
    /**
     * Getter for '_telegram_payment_charge_id'
     * Returns: Current value of '_telegram_payment_charge_id'
     */
    @property string telegramPaymentChargeId () { return _telegram_payment_charge_id; }
    /**
     * Setter for '_telegram_payment_charge_id'
     * Params: telegramPaymentChargeIdNew = New value of '_telegram_payment_charge_id'
     * Returns: New value of '_telegram_payment_charge_id'
     */
    @property string telegramPaymentChargeId ( string telegramPaymentChargeIdNew ) { return _telegram_payment_charge_id = telegramPaymentChargeIdNew; }

    /** Provider payment identifier */
    private string _provider_payment_charge_id;
    /**
     * Getter for '_provider_payment_charge_id'
     * Returns: Current value of '_provider_payment_charge_id'
     */
    @property string providerPaymentChargeId () { return _provider_payment_charge_id; }
    /**
     * Setter for '_provider_payment_charge_id'
     * Params: providerPaymentChargeIdNew = New value of '_provider_payment_charge_id'
     * Returns: New value of '_provider_payment_charge_id'
     */
    @property string providerPaymentChargeId ( string providerPaymentChargeIdNew ) { return _provider_payment_charge_id = providerPaymentChargeIdNew; }
}

