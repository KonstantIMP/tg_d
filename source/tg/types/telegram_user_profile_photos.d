/**
 * Contains TelegramUserProfilePhotos
 */
module tg.types.telegram_user_profile_photos;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represent a user's profile pictures.
 */
class TelegramUserProfilePhotos : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _total_count = 0;
        _photos = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "total_count" !in data ) throw new TelegramException("Could not find reqired entry : total_count");
        _total_count = data["total_count"].integer();

        if ( "photos" !in data ) throw new TelegramException("Could not find reqired entry : photos");
        _photos = new TelegramPhotoSize(data["photos"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["total_count"] = _total_count;

        data["photos"] = _photos.getAsJson();

        return data;
    }

    /** Total number of profile pictures the target user has */
    private ulong _total_count;
    /**
     * Getter for '_total_count'
     * Returns: Current value of '_total_count'
     */
    @property ulong totalCount () { return _total_count; }
    /**
     * Setter for '_total_count'
     * Params: totalCountNew = New value of '_total_count'
     * Returns: New value of '_total_count'
     */
    @property ulong totalCount ( ulong totalCountNew ) { return _total_count = totalCountNew; }

    /** Requested profile pictures (in up to 4 sizes each) */
    private TelegramPhotoSize _photos;
    /**
     * Getter for '_photos'
     * Returns: Current value of '_photos'
     */
    @property TelegramPhotoSize photos () { return _photos; }
    /**
     * Setter for '_photos'
     * Params: photosNew = New value of '_photos'
     * Returns: New value of '_photos'
     */
    @property TelegramPhotoSize photos ( TelegramPhotoSize photosNew ) { return _photos = photosNew; }
}

