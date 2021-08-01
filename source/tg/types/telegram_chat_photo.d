/**
 * Contains TelegramChatPhoto
 */
module tg.types.telegram_chat_photo;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a chat photo.
 */
class TelegramChatPhoto : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _small_file_id = "";
        _small_file_unique_id = "";
        _big_file_id = "";
        _big_file_unique_id = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "small_file_id" !in data ) throw new TelegramException("Could not find reqired entry : small_file_id");
        _small_file_id = data["small_file_id"].str();

        if ( "small_file_unique_id" !in data ) throw new TelegramException("Could not find reqired entry : small_file_unique_id");
        _small_file_unique_id = data["small_file_unique_id"].str();

        if ( "big_file_id" !in data ) throw new TelegramException("Could not find reqired entry : big_file_id");
        _big_file_id = data["big_file_id"].str();

        if ( "big_file_unique_id" !in data ) throw new TelegramException("Could not find reqired entry : big_file_unique_id");
        _big_file_unique_id = data["big_file_unique_id"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["small_file_id"] = _small_file_id;

        data["small_file_unique_id"] = _small_file_unique_id;

        data["big_file_id"] = _big_file_id;

        data["big_file_unique_id"] = _big_file_unique_id;

        return data;
    }

    /** File identifier of small (160x160) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed. */
    private string _small_file_id;
    /**
     * Getter for '_small_file_id'
     * Returns: Current value of '_small_file_id'
     */
    @property string smallFileId () { return _small_file_id; }
    /**
     * Setter for '_small_file_id'
     * Params: smallFileIdNew = New value of '_small_file_id'
     * Returns: New value of '_small_file_id'
     */
    @property string smallFileId ( string smallFileIdNew ) { return _small_file_id = smallFileIdNew; }

    /** Unique file identifier of small (160x160) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file. */
    private string _small_file_unique_id;
    /**
     * Getter for '_small_file_unique_id'
     * Returns: Current value of '_small_file_unique_id'
     */
    @property string smallFileUniqueId () { return _small_file_unique_id; }
    /**
     * Setter for '_small_file_unique_id'
     * Params: smallFileUniqueIdNew = New value of '_small_file_unique_id'
     * Returns: New value of '_small_file_unique_id'
     */
    @property string smallFileUniqueId ( string smallFileUniqueIdNew ) { return _small_file_unique_id = smallFileUniqueIdNew; }

    /** File identifier of big (640x640) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed. */
    private string _big_file_id;
    /**
     * Getter for '_big_file_id'
     * Returns: Current value of '_big_file_id'
     */
    @property string bigFileId () { return _big_file_id; }
    /**
     * Setter for '_big_file_id'
     * Params: bigFileIdNew = New value of '_big_file_id'
     * Returns: New value of '_big_file_id'
     */
    @property string bigFileId ( string bigFileIdNew ) { return _big_file_id = bigFileIdNew; }

    /** Unique file identifier of big (640x640) chat photo, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file. */
    private string _big_file_unique_id;
    /**
     * Getter for '_big_file_unique_id'
     * Returns: Current value of '_big_file_unique_id'
     */
    @property string bigFileUniqueId () { return _big_file_unique_id; }
    /**
     * Setter for '_big_file_unique_id'
     * Params: bigFileUniqueIdNew = New value of '_big_file_unique_id'
     * Returns: New value of '_big_file_unique_id'
     */
    @property string bigFileUniqueId ( string bigFileUniqueIdNew ) { return _big_file_unique_id = bigFileUniqueIdNew; }
}

