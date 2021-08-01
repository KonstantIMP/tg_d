/**
 * Contains TelegramPassportData
 */
module tg.passport.types.telegram_passport_data;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Contains information about Telegram Passport data shared with the bot by the user.
 */
class TelegramPassportData : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _data = null;
        _credentials = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "data" !in data ) throw new TelegramException("Could not find reqired entry : data");
        _data = new TelegramEncryptedPassportElement(data["data"]);

        if ( "credentials" !in data ) throw new TelegramException("Could not find reqired entry : credentials");
        _credentials = new TelegramEncryptedCredentials(data["credentials"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["data"] = _data.getAsJson();

        data["credentials"] = _credentials.getAsJson();

        return data;
    }

    /** Array with information about documents and other Telegram Passport elements that was shared with the bot */
    private TelegramEncryptedPassportElement _data;
    /**
     * Getter for '_data'
     * Returns: Current value of '_data'
     */
    @property TelegramEncryptedPassportElement data () { return _data; }
    /**
     * Setter for '_data'
     * Params: dataNew = New value of '_data'
     * Returns: New value of '_data'
     */
    @property TelegramEncryptedPassportElement data ( TelegramEncryptedPassportElement dataNew ) { return _data = dataNew; }

    /** Encrypted credentials required to decrypt the data */
    private TelegramEncryptedCredentials _credentials;
    /**
     * Getter for '_credentials'
     * Returns: Current value of '_credentials'
     */
    @property TelegramEncryptedCredentials credentials () { return _credentials; }
    /**
     * Setter for '_credentials'
     * Params: credentialsNew = New value of '_credentials'
     * Returns: New value of '_credentials'
     */
    @property TelegramEncryptedCredentials credentials ( TelegramEncryptedCredentials credentialsNew ) { return _credentials = credentialsNew; }
}

