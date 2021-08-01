/**
 * Contains TelegramEncryptedPassportElement
 */
module tg.passport.types.telegram_encrypted_passport_element;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * Contains information about documents or other Telegram Passport elements shared with the bot by the user.
 */
class TelegramEncryptedPassportElement : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _data = "";
        _phone_number = "";
        _email = "";
        _files = null;
        _front_side = null;
        _reverse_side = null;
        _selfie = null;
        _translation = null;
        _hash = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "data" in data )
        _data = data["data"].str();

        if ( "phone_number" in data )
        _phone_number = data["phone_number"].str();

        if ( "email" in data )
        _email = data["email"].str();

        if ( "files" in data )
        _files = toTelegram!TelegramPassportFile(data["files"]);

        if ( "front_side" in data )
        _front_side = new TelegramPassportFile(data["front_side"]);

        if ( "reverse_side" in data )
        _reverse_side = new TelegramPassportFile(data["reverse_side"]);

        if ( "selfie" in data )
        _selfie = new TelegramPassportFile(data["selfie"]);

        if ( "translation" in data )
        _translation = toTelegram!TelegramPassportFile(data["translation"]);

        if ( "hash" !in data ) throw new TelegramException("Could not find reqired entry : hash");
        _hash = data["hash"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        if ( _data != "" ) data["data"] = _data;

        if ( _phone_number != "" ) data["phone_number"] = _phone_number;

        if ( _email != "" ) data["email"] = _email;

        if ( _files !is null ) data["files"] = _files.getAsJson();

        if ( _front_side !is null ) data["front_side"] = _front_side.getAsJson();

        if ( _reverse_side !is null ) data["reverse_side"] = _reverse_side.getAsJson();

        if ( _selfie !is null ) data["selfie"] = _selfie.getAsJson();

        if ( _translation !is null ) data["translation"] = _translation.getAsJson();

        data["hash"] = _hash;

        return data;
    }

    /** Element type. One of &#8220;personal_details&#8221;, &#8220;passport&#8221;, &#8220;driver_license&#8221;, &#8220;identity_card&#8221;, &#8220;internal_passport&#8221;, &#8220;address&#8221;, &#8220;utility_bill&#8221;, &#8220;bank_statement&#8221;, &#8220;rental_agreement&#8221;, &#8220;passport_registration&#8221;, &#8220;temporary_registration&#8221;, &#8220;phone_number&#8221;, &#8220;email&#8221;. */
    private string _type;
    /**
     * Getter for '_type'
     * Returns: Current value of '_type'
     */
    @property string type () { return _type; }
    /**
     * Setter for '_type'
     * Params: typeNew = New value of '_type'
     * Returns: New value of '_type'
     */
    @property string type ( string typeNew ) { return _type = typeNew; }

    /** <em>Optional</em>. Base64-encoded encrypted Telegram Passport element data provided by the user, available for &#8220;personal_details&#8221;, &#8220;passport&#8221;, &#8220;driver_license&#8221;, &#8220;identity_card&#8221;, &#8220;internal_passport&#8221; and &#8220;address&#8221; types. Can be decrypted and verified using the accompanying EncryptedCredentials. */
    private string _data;
    /**
     * Getter for '_data'
     * Returns: Current value of '_data'
     */
    @property string data () { return _data; }
    /**
     * Setter for '_data'
     * Params: dataNew = New value of '_data'
     * Returns: New value of '_data'
     */
    @property string data ( string dataNew ) { return _data = dataNew; }

    /** <em>Optional</em>. User's verified phone number, available only for &#8220;phone_number&#8221; type */
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

    /** <em>Optional</em>. User's verified email address, available only for &#8220;email&#8221; type */
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

    /** <em>Optional</em>. Array of encrypted files with documents provided by the user, available for &#8220;utility_bill&#8221;, &#8220;bank_statement&#8221;, &#8220;rental_agreement&#8221;, &#8220;passport_registration&#8221; and &#8220;temporary_registration&#8221; types. Files can be decrypted and verified using the accompanying EncryptedCredentials. */
    private TelegramPassportFile[] _files;
    /**
     * Getter for '_files'
     * Returns: Current value of '_files'
     */
    @property TelegramPassportFile[] files () { return _files; }
    /**
     * Setter for '_files'
     * Params: filesNew = New value of '_files'
     * Returns: New value of '_files'
     */
    @property TelegramPassportFile[] files ( TelegramPassportFile[] filesNew ) { return _files = filesNew; }

    /** <em>Optional</em>. Encrypted file with the front side of the document, provided by the user. Available for &#8220;passport&#8221;, &#8220;driver_license&#8221;, &#8220;identity_card&#8221; and &#8220;internal_passport&#8221;. The file can be decrypted and verified using the accompanying EncryptedCredentials. */
    private TelegramPassportFile _front_side;
    /**
     * Getter for '_front_side'
     * Returns: Current value of '_front_side'
     */
    @property TelegramPassportFile frontSide () { return _front_side; }
    /**
     * Setter for '_front_side'
     * Params: frontSideNew = New value of '_front_side'
     * Returns: New value of '_front_side'
     */
    @property TelegramPassportFile frontSide ( TelegramPassportFile frontSideNew ) { return _front_side = frontSideNew; }

    /** <em>Optional</em>. Encrypted file with the reverse side of the document, provided by the user. Available for &#8220;driver_license&#8221; and &#8220;identity_card&#8221;. The file can be decrypted and verified using the accompanying EncryptedCredentials. */
    private TelegramPassportFile _reverse_side;
    /**
     * Getter for '_reverse_side'
     * Returns: Current value of '_reverse_side'
     */
    @property TelegramPassportFile reverseSide () { return _reverse_side; }
    /**
     * Setter for '_reverse_side'
     * Params: reverseSideNew = New value of '_reverse_side'
     * Returns: New value of '_reverse_side'
     */
    @property TelegramPassportFile reverseSide ( TelegramPassportFile reverseSideNew ) { return _reverse_side = reverseSideNew; }

    /** <em>Optional</em>. Encrypted file with the selfie of the user holding a document, provided by the user; available for &#8220;passport&#8221;, &#8220;driver_license&#8221;, &#8220;identity_card&#8221; and &#8220;internal_passport&#8221;. The file can be decrypted and verified using the accompanying EncryptedCredentials. */
    private TelegramPassportFile _selfie;
    /**
     * Getter for '_selfie'
     * Returns: Current value of '_selfie'
     */
    @property TelegramPassportFile selfie () { return _selfie; }
    /**
     * Setter for '_selfie'
     * Params: selfieNew = New value of '_selfie'
     * Returns: New value of '_selfie'
     */
    @property TelegramPassportFile selfie ( TelegramPassportFile selfieNew ) { return _selfie = selfieNew; }

    /** <em>Optional</em>. Array of encrypted files with translated versions of documents provided by the user. Available if requested for &#8220;passport&#8221;, &#8220;driver_license&#8221;, &#8220;identity_card&#8221;, &#8220;internal_passport&#8221;, &#8220;utility_bill&#8221;, &#8220;bank_statement&#8221;, &#8220;rental_agreement&#8221;, &#8220;passport_registration&#8221; and &#8220;temporary_registration&#8221; types. Files can be decrypted and verified using the accompanying EncryptedCredentials. */
    private TelegramPassportFile[] _translation;
    /**
     * Getter for '_translation'
     * Returns: Current value of '_translation'
     */
    @property TelegramPassportFile[] translation () { return _translation; }
    /**
     * Setter for '_translation'
     * Params: translationNew = New value of '_translation'
     * Returns: New value of '_translation'
     */
    @property TelegramPassportFile[] translation ( TelegramPassportFile[] translationNew ) { return _translation = translationNew; }

    /** Base64-encoded element hash for using in PassportElementErrorUnspecified */
    private string _hash;
    /**
     * Getter for '_hash'
     * Returns: Current value of '_hash'
     */
    @property string hash () { return _hash; }
    /**
     * Setter for '_hash'
     * Params: hashNew = New value of '_hash'
     * Returns: New value of '_hash'
     */
    @property string hash ( string hashNew ) { return _hash = hashNew; }
}

