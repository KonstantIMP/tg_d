/**
 * Contains TelegramInvoice
 */
module tg.payment.types.telegram_invoice;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object contains basic information about an invoice.
 */
class TelegramInvoice : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _title = "";
        _description = "";
        _start_parameter = "";
        _currency = "";
        _total_amount = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "title" !in data ) throw new TelegramException("Could not find reqired entry : title");
        _title = data["title"].str();

        if ( "description" !in data ) throw new TelegramException("Could not find reqired entry : description");
        _description = data["description"].str();

        if ( "start_parameter" !in data ) throw new TelegramException("Could not find reqired entry : start_parameter");
        _start_parameter = data["start_parameter"].str();

        if ( "currency" !in data ) throw new TelegramException("Could not find reqired entry : currency");
        _currency = data["currency"].str();

        if ( "total_amount" !in data ) throw new TelegramException("Could not find reqired entry : total_amount");
        _total_amount = data["total_amount"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["title"] = _title;

        data["description"] = _description;

        data["start_parameter"] = _start_parameter;

        data["currency"] = _currency;

        data["total_amount"] = _total_amount;

        return data;
    }

    /** Product name */
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

    /** Product description */
    private string _description;
    /**
     * Getter for '_description'
     * Returns: Current value of '_description'
     */
    @property string description () { return _description; }
    /**
     * Setter for '_description'
     * Params: descriptionNew = New value of '_description'
     * Returns: New value of '_description'
     */
    @property string description ( string descriptionNew ) { return _description = descriptionNew; }

    /** Unique bot deep-linking parameter that can be used to generate this invoice */
    private string _start_parameter;
    /**
     * Getter for '_start_parameter'
     * Returns: Current value of '_start_parameter'
     */
    @property string startParameter () { return _start_parameter; }
    /**
     * Setter for '_start_parameter'
     * Params: startParameterNew = New value of '_start_parameter'
     * Returns: New value of '_start_parameter'
     */
    @property string startParameter ( string startParameterNew ) { return _start_parameter = startParameterNew; }

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
}

