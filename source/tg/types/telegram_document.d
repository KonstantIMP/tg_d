/**
 * Contains TelegramDocument
 */
module tg.types.telegram_document;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a general file (as opposed to photos, voice messages and audio files).
 */
class TelegramDocument : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _file_id = "";
        _file_unique_id = "";
        _thumb = null;
        _file_name = "";
        _mime_type = "";
        _file_size = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "file_id" !in data ) throw new TelegramException("Could not find reqired entry : file_id");
        _file_id = data["file_id"].str();

        if ( "file_unique_id" !in data ) throw new TelegramException("Could not find reqired entry : file_unique_id");
        _file_unique_id = data["file_unique_id"].str();

        if ( "thumb" in data )
        _thumb = new TelegramPhotoSize(data["thumb"]);

        if ( "file_name" in data )
        _file_name = data["file_name"].str();

        if ( "mime_type" in data )
        _mime_type = data["mime_type"].str();

        if ( "file_size" in data )
        _file_size = data["file_size"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["file_id"] = _file_id;

        data["file_unique_id"] = _file_unique_id;

        if ( _thumb !is null ) data["thumb"] = _thumb.getAsJson();

        if ( _file_name != "" ) data["file_name"] = _file_name;

        if ( _mime_type != "" ) data["mime_type"] = _mime_type;

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

    /** <em>Optional</em>. Document thumbnail as defined by sender */
    private TelegramPhotoSize _thumb;
    /**
     * Getter for '_thumb'
     * Returns: Current value of '_thumb'
     */
    @property TelegramPhotoSize thumb () { return _thumb; }
    /**
     * Setter for '_thumb'
     * Params: thumbNew = New value of '_thumb'
     * Returns: New value of '_thumb'
     */
    @property TelegramPhotoSize thumb ( TelegramPhotoSize thumbNew ) { return _thumb = thumbNew; }

    /** <em>Optional</em>. Original filename as defined by sender */
    private string _file_name;
    /**
     * Getter for '_file_name'
     * Returns: Current value of '_file_name'
     */
    @property string fileName () { return _file_name; }
    /**
     * Setter for '_file_name'
     * Params: fileNameNew = New value of '_file_name'
     * Returns: New value of '_file_name'
     */
    @property string fileName ( string fileNameNew ) { return _file_name = fileNameNew; }

    /** <em>Optional</em>. MIME type of the file as defined by sender */
    private string _mime_type;
    /**
     * Getter for '_mime_type'
     * Returns: Current value of '_mime_type'
     */
    @property string mimeType () { return _mime_type; }
    /**
     * Setter for '_mime_type'
     * Params: mimeTypeNew = New value of '_mime_type'
     * Returns: New value of '_mime_type'
     */
    @property string mimeType ( string mimeTypeNew ) { return _mime_type = mimeTypeNew; }

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

