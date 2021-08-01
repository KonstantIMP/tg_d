/**
 * Contains TelegramLabeledPrice
 */
module tg.payment.types.telegram_labeled_price;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a portion of the price for goods or services.
 */
class TelegramLabeledPrice : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _label = "";
        _amount = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "label" !in data ) throw new TelegramException("Could not find reqired entry : label");
        _label = data["label"].str();

        if ( "amount" !in data ) throw new TelegramException("Could not find reqired entry : amount");
        _amount = data["amount"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["label"] = _label;

        data["amount"] = _amount;

        return data;
    }

    /** Portion label */
    private string _label;
    /**
     * Getter for '_label'
     * Returns: Current value of '_label'
     */
    @property string label () { return _label; }
    /**
     * Setter for '_label'
     * Params: labelNew = New value of '_label'
     * Returns: New value of '_label'
     */
    @property string label ( string labelNew ) { return _label = labelNew; }

    /** Price of the product in the <em>smallest units</em> of the currency (integer, <strong>not</strong> float/double). For example, for a price of <code>US$ 1.45</code> pass <code>amount = 145</code>. See the <em>exp</em> parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). */
    private ulong _amount;
    /**
     * Getter for '_amount'
     * Returns: Current value of '_amount'
     */
    @property ulong amount () { return _amount; }
    /**
     * Setter for '_amount'
     * Params: amountNew = New value of '_amount'
     * Returns: New value of '_amount'
     */
    @property ulong amount ( ulong amountNew ) { return _amount = amountNew; }
}

