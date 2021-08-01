/**
 * Contains TelegramPhotoSize
 */
module tg.types.telegram_photo_size;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents one size of a photo or a file / sticker thumbnail.
 */
class TelegramPhotoSize : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _file_id = "";
        _file_unique_id = "";
        _width = 0;
        _height = 0;
        _file_size = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "file_id" !in data ) throw new TelegramException("Could not find reqired entry : file_id");
        _file_id = data["file_id"].str();

        if ( "file_unique_id" !in data ) throw new TelegramException("Could not find reqired entry : file_unique_id");
        _file_unique_id = data["file_unique_id"].str();

        if ( "width" !in data ) throw new TelegramException("Could not find reqired entry : width");
        _width = data["width"].integer();

        if ( "height" !in data ) throw new TelegramException("Could not find reqired entry : height");
        _height = data["height"].integer();

        if ( "file_size" in data )
        _file_size = data["file_size"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["file_id"] = _file_id;

        data["file_unique_id"] = _file_unique_id;

        data["width"] = _width;

        data["height"] = _height;

        if ( _file_size != 0 ) data["file_size"] = _file_size;

        return data;
    }

    /** Identifier for this file, which can be used to download or reuse the file */
    private string _file_id;
    /**
     * Getter for '_file_id'
     * Returns: Current value of '_file_id'
     */
    @property string fileId () { return _file_id; }
    /**
     * Setter for '_file_id'
     * Params: fileIdNew = New value of '_file_id'
     * Returns: New value of '_file_id'
     */
    @property string fileId ( string fileIdNew ) { return _file_id = fileIdNew; }

    /** Unique identifier for this file, which is supposed to be the same over time and for different bots. Can't be used to download or reuse the file. */
    private string _file_unique_id;
    /**
     * Getter for '_file_unique_id'
     * Returns: Current value of '_file_unique_id'
     */
    @property string fileUniqueId () { return _file_unique_id; }
    /**
     * Setter for '_file_unique_id'
     * Params: fileUniqueIdNew = New value of '_file_unique_id'
     * Returns: New value of '_file_unique_id'
     */
    @property string fileUniqueId ( string fileUniqueIdNew ) { return _file_unique_id = fileUniqueIdNew; }

    /** Photo width */
    private ulong _width;
    /**
     * Getter for '_width'
     * Returns: Current value of '_width'
     */
    @property ulong width () { return _width; }
    /**
     * Setter for '_width'
     * Params: widthNew = New value of '_width'
     * Returns: New value of '_width'
     */
    @property ulong width ( ulong widthNew ) { return _width = widthNew; }

    /** Photo height */
    private ulong _height;
    /**
     * Getter for '_height'
     * Returns: Current value of '_height'
     */
    @property ulong height () { return _height; }
    /**
     * Setter for '_height'
     * Params: heightNew = New value of '_height'
     * Returns: New value of '_height'
     */
    @property ulong height ( ulong heightNew ) { return _height = heightNew; }

    /** <em>Optional</em>. File size */
    private ulong _file_size;
    /**
     * Getter for '_file_size'
     * Returns: Current value of '_file_size'
     */
    @property ulong fileSize () { return _file_size; }
    /**
     * Setter for '_file_size'
     * Params: fileSizeNew = New value of '_file_size'
     * Returns: New value of '_file_size'
     */
    @property ulong fileSize ( ulong fileSizeNew ) { return _file_size = fileSizeNew; }
}

