/**
 * Contains TelegramEncryptedCredentials
 */
module tg.passport.types.telegram_encrypted_credentials;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Contains data required for decrypting and authenticating EncryptedPassportElement. See the Telegram Passport Documentation for a complete description of the data decryption and authentication processes.
 */
class TelegramEncryptedCredentials : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _data = "";
        _hash = "";
        _secret = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "data" !in data ) throw new TelegramException("Could not find reqired entry : data");
        _data = data["data"].str();

        if ( "hash" !in data ) throw new TelegramException("Could not find reqired entry : hash");
        _hash = data["hash"].str();

        if ( "secret" !in data ) throw new TelegramException("Could not find reqired entry : secret");
        _secret = data["secret"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["data"] = _data;

        data["hash"] = _hash;

        data["secret"] = _secret;

        return data;
    }

    /** Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication */
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

    /** Base64-encoded data hash for data authentication */
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

    /** Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption */
    private string _secret;
    /**
     * Getter for '_secret'
     * Returns: Current value of '_secret'
     */
    @property string secret () { return _secret; }
    /**
     * Setter for '_secret'
     * Params: secretNew = New value of '_secret'
     * Returns: New value of '_secret'
     */
    @property string secret ( string secretNew ) { return _secret = secretNew; }
}

