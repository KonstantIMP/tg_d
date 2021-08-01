/**
 * Contains TelegramInputInvoiceMessageContent
 */
module tg.inline.types.telegram_input_invoice_message_content;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents the content of an invoice message to be sent as the result of an inline query.
 */
class TelegramInputInvoiceMessageContent : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _title = "";
        _description = "";
        _payload = "";
        _provider_token = "";
        _currency = "";
        _prices = null;
        _max_tip_amount = 0;
        _suggested_tip_amounts = 0;
        _provider_data = "";
        _photo_url = "";
        _photo_size = 0;
        _photo_width = 0;
        _photo_height = 0;
        _need_name = false;
        _need_phone_number = false;
        _need_email = false;
        _need_shipping_address = false;
        _send_phone_number_to_provider = false;
        _send_email_to_provider = false;
        _is_flexible = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "title" !in data ) throw new TelegramException("Could not find reqired entry : title");
        _title = data["title"].str();

        if ( "description" !in data ) throw new TelegramException("Could not find reqired entry : description");
        _description = data["description"].str();

        if ( "payload" !in data ) throw new TelegramException("Could not find reqired entry : payload");
        _payload = data["payload"].str();

        if ( "provider_token" !in data ) throw new TelegramException("Could not find reqired entry : provider_token");
        _provider_token = data["provider_token"].str();

        if ( "currency" !in data ) throw new TelegramException("Could not find reqired entry : currency");
        _currency = data["currency"].str();

        if ( "prices" !in data ) throw new TelegramException("Could not find reqired entry : prices");
        _prices = new TelegramLabeledPrice(data["prices"]);

        if ( "max_tip_amount" in data )
        _max_tip_amount = data["max_tip_amount"].integer();

        if ( "suggested_tip_amounts" in data )
        _suggested_tip_amounts = data["suggested_tip_amounts"].integer();

        if ( "provider_data" in data )
        _provider_data = data["provider_data"].str();

        if ( "photo_url" in data )
        _photo_url = data["photo_url"].str();

        if ( "photo_size" in data )
        _photo_size = data["photo_size"].integer();

        if ( "photo_width" in data )
        _photo_width = data["photo_width"].integer();

        if ( "photo_height" in data )
        _photo_height = data["photo_height"].integer();

        if ( "need_name" in data )
        _need_name = data["need_name"].boolean();

        if ( "need_phone_number" in data )
        _need_phone_number = data["need_phone_number"].boolean();

        if ( "need_email" in data )
        _need_email = data["need_email"].boolean();

        if ( "need_shipping_address" in data )
        _need_shipping_address = data["need_shipping_address"].boolean();

        if ( "send_phone_number_to_provider" in data )
        _send_phone_number_to_provider = data["send_phone_number_to_provider"].boolean();

        if ( "send_email_to_provider" in data )
        _send_email_to_provider = data["send_email_to_provider"].boolean();

        if ( "is_flexible" in data )
        _is_flexible = data["is_flexible"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["title"] = _title;

        data["description"] = _description;

        data["payload"] = _payload;

        data["provider_token"] = _provider_token;

        data["currency"] = _currency;

        data["prices"] = _prices.getAsJson();

        if ( _max_tip_amount != 0 ) data["max_tip_amount"] = _max_tip_amount;

        if ( _suggested_tip_amounts != 0 ) data["suggested_tip_amounts"] = _suggested_tip_amounts;

        if ( _provider_data != "" ) data["provider_data"] = _provider_data;

        if ( _photo_url != "" ) data["photo_url"] = _photo_url;

        if ( _photo_size != 0 ) data["photo_size"] = _photo_size;

        if ( _photo_width != 0 ) data["photo_width"] = _photo_width;

        if ( _photo_height != 0 ) data["photo_height"] = _photo_height;

        data["need_name"] = _need_name;

        data["need_phone_number"] = _need_phone_number;

        data["need_email"] = _need_email;

        data["need_shipping_address"] = _need_shipping_address;

        data["send_phone_number_to_provider"] = _send_phone_number_to_provider;

        data["send_email_to_provider"] = _send_email_to_provider;

        data["is_flexible"] = _is_flexible;

        return data;
    }

    /** Product name, 1-32 characters */
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

    /** Product description, 1-255 characters */
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

    /** Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes. */
    private string _payload;
    /**
     * Getter for '_payload'
     * Returns: Current value of '_payload'
     */
    @property string payload () { return _payload; }
    /**
     * Setter for '_payload'
     * Params: payloadNew = New value of '_payload'
     * Returns: New value of '_payload'
     */
    @property string payload ( string payloadNew ) { return _payload = payloadNew; }

    /** Payment provider token, obtained via Botfather */
    private string _provider_token;
    /**
     * Getter for '_provider_token'
     * Returns: Current value of '_provider_token'
     */
    @property string providerToken () { return _provider_token; }
    /**
     * Setter for '_provider_token'
     * Params: providerTokenNew = New value of '_provider_token'
     * Returns: New value of '_provider_token'
     */
    @property string providerToken ( string providerTokenNew ) { return _provider_token = providerTokenNew; }

    /** Three-letter ISO 4217 currency code, see more on currencies */
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

    /** Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.) */
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

    /** <em>Optional</em>. The maximum accepted amount for tips in the <em>smallest units</em> of the currency (integer, <strong>not</strong> float/double). For example, for a maximum tip of <code>US$ 1.45</code> pass <code>max_tip_amount = 145</code>. See the <em>exp</em> parameter in currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0 */
    private ulong _max_tip_amount;
    /**
     * Getter for '_max_tip_amount'
     * Returns: Current value of '_max_tip_amount'
     */
    @property ulong maxTipAmount () { return _max_tip_amount; }
    /**
     * Setter for '_max_tip_amount'
     * Params: maxTipAmountNew = New value of '_max_tip_amount'
     * Returns: New value of '_max_tip_amount'
     */
    @property ulong maxTipAmount ( ulong maxTipAmountNew ) { return _max_tip_amount = maxTipAmountNew; }

    /** <em>Optional</em>. A JSON-serialized array of suggested amounts of tip in the <em>smallest units</em> of the currency (integer, <strong>not</strong> float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed <em>max_tip_amount</em>. */
    private ulong _suggested_tip_amounts;
    /**
     * Getter for '_suggested_tip_amounts'
     * Returns: Current value of '_suggested_tip_amounts'
     */
    @property ulong suggestedTipAmounts () { return _suggested_tip_amounts; }
    /**
     * Setter for '_suggested_tip_amounts'
     * Params: suggestedTipAmountsNew = New value of '_suggested_tip_amounts'
     * Returns: New value of '_suggested_tip_amounts'
     */
    @property ulong suggestedTipAmounts ( ulong suggestedTipAmountsNew ) { return _suggested_tip_amounts = suggestedTipAmountsNew; }

    /** <em>Optional</em>. A JSON-serialized object for data about the invoice, which will be shared with the payment provider. A detailed description of the required fields should be provided by the payment provider. */
    private string _provider_data;
    /**
     * Getter for '_provider_data'
     * Returns: Current value of '_provider_data'
     */
    @property string providerData () { return _provider_data; }
    /**
     * Setter for '_provider_data'
     * Params: providerDataNew = New value of '_provider_data'
     * Returns: New value of '_provider_data'
     */
    @property string providerData ( string providerDataNew ) { return _provider_data = providerDataNew; }

    /** <em>Optional</em>. URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for. */
    private string _photo_url;
    /**
     * Getter for '_photo_url'
     * Returns: Current value of '_photo_url'
     */
    @property string photoUrl () { return _photo_url; }
    /**
     * Setter for '_photo_url'
     * Params: photoUrlNew = New value of '_photo_url'
     * Returns: New value of '_photo_url'
     */
    @property string photoUrl ( string photoUrlNew ) { return _photo_url = photoUrlNew; }

    /** <em>Optional</em>. Photo size */
    private ulong _photo_size;
    /**
     * Getter for '_photo_size'
     * Returns: Current value of '_photo_size'
     */
    @property ulong photoSize () { return _photo_size; }
    /**
     * Setter for '_photo_size'
     * Params: photoSizeNew = New value of '_photo_size'
     * Returns: New value of '_photo_size'
     */
    @property ulong photoSize ( ulong photoSizeNew ) { return _photo_size = photoSizeNew; }

    /** <em>Optional</em>. Photo width */
    private ulong _photo_width;
    /**
     * Getter for '_photo_width'
     * Returns: Current value of '_photo_width'
     */
    @property ulong photoWidth () { return _photo_width; }
    /**
     * Setter for '_photo_width'
     * Params: photoWidthNew = New value of '_photo_width'
     * Returns: New value of '_photo_width'
     */
    @property ulong photoWidth ( ulong photoWidthNew ) { return _photo_width = photoWidthNew; }

    /** <em>Optional</em>. Photo height */
    private ulong _photo_height;
    /**
     * Getter for '_photo_height'
     * Returns: Current value of '_photo_height'
     */
    @property ulong photoHeight () { return _photo_height; }
    /**
     * Setter for '_photo_height'
     * Params: photoHeightNew = New value of '_photo_height'
     * Returns: New value of '_photo_height'
     */
    @property ulong photoHeight ( ulong photoHeightNew ) { return _photo_height = photoHeightNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if you require the user's full name to complete the order */
    private bool _need_name;
    /**
     * Getter for '_need_name'
     * Returns: Current value of '_need_name'
     */
    @property bool needName () { return _need_name; }
    /**
     * Setter for '_need_name'
     * Params: needNameNew = New value of '_need_name'
     * Returns: New value of '_need_name'
     */
    @property bool needName ( bool needNameNew ) { return _need_name = needNameNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if you require the user's phone number to complete the order */
    private bool _need_phone_number;
    /**
     * Getter for '_need_phone_number'
     * Returns: Current value of '_need_phone_number'
     */
    @property bool needPhoneNumber () { return _need_phone_number; }
    /**
     * Setter for '_need_phone_number'
     * Params: needPhoneNumberNew = New value of '_need_phone_number'
     * Returns: New value of '_need_phone_number'
     */
    @property bool needPhoneNumber ( bool needPhoneNumberNew ) { return _need_phone_number = needPhoneNumberNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if you require the user's email address to complete the order */
    private bool _need_email;
    /**
     * Getter for '_need_email'
     * Returns: Current value of '_need_email'
     */
    @property bool needEmail () { return _need_email; }
    /**
     * Setter for '_need_email'
     * Params: needEmailNew = New value of '_need_email'
     * Returns: New value of '_need_email'
     */
    @property bool needEmail ( bool needEmailNew ) { return _need_email = needEmailNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if you require the user's shipping address to complete the order */
    private bool _need_shipping_address;
    /**
     * Getter for '_need_shipping_address'
     * Returns: Current value of '_need_shipping_address'
     */
    @property bool needShippingAddress () { return _need_shipping_address; }
    /**
     * Setter for '_need_shipping_address'
     * Params: needShippingAddressNew = New value of '_need_shipping_address'
     * Returns: New value of '_need_shipping_address'
     */
    @property bool needShippingAddress ( bool needShippingAddressNew ) { return _need_shipping_address = needShippingAddressNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if user's phone number should be sent to provider */
    private bool _send_phone_number_to_provider;
    /**
     * Getter for '_send_phone_number_to_provider'
     * Returns: Current value of '_send_phone_number_to_provider'
     */
    @property bool sendPhoneNumberToProvider () { return _send_phone_number_to_provider; }
    /**
     * Setter for '_send_phone_number_to_provider'
     * Params: sendPhoneNumberToProviderNew = New value of '_send_phone_number_to_provider'
     * Returns: New value of '_send_phone_number_to_provider'
     */
    @property bool sendPhoneNumberToProvider ( bool sendPhoneNumberToProviderNew ) { return _send_phone_number_to_provider = sendPhoneNumberToProviderNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if user's email address should be sent to provider */
    private bool _send_email_to_provider;
    /**
     * Getter for '_send_email_to_provider'
     * Returns: Current value of '_send_email_to_provider'
     */
    @property bool sendEmailToProvider () { return _send_email_to_provider; }
    /**
     * Setter for '_send_email_to_provider'
     * Params: sendEmailToProviderNew = New value of '_send_email_to_provider'
     * Returns: New value of '_send_email_to_provider'
     */
    @property bool sendEmailToProvider ( bool sendEmailToProviderNew ) { return _send_email_to_provider = sendEmailToProviderNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if the final price depends on the shipping method */
    private bool _is_flexible;
    /**
     * Getter for '_is_flexible'
     * Returns: Current value of '_is_flexible'
     */
    @property bool isFlexible () { return _is_flexible; }
    /**
     * Setter for '_is_flexible'
     * Params: isFlexibleNew = New value of '_is_flexible'
     * Returns: New value of '_is_flexible'
     */
    @property bool isFlexible ( bool isFlexibleNew ) { return _is_flexible = isFlexibleNew; }
}

