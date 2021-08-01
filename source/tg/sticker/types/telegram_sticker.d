/**
 * Contains TelegramSticker
 */
module tg.sticker.types.telegram_sticker;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a sticker.
 */
class TelegramSticker : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _file_id = "";
        _file_unique_id = "";
        _width = 0;
        _height = 0;
        _is_animated = false;
        _thumb = null;
        _emoji = "";
        _set_name = "";
        _mask_position = null;
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

        if ( "is_animated" !in data ) throw new TelegramException("Could not find reqired entry : is_animated");
        _is_animated = data["is_animated"].boolean();

        if ( "thumb" in data )
        _thumb = new TelegramPhotoSize(data["thumb"]);

        if ( "emoji" in data )
        _emoji = data["emoji"].str();

        if ( "set_name" in data )
        _set_name = data["set_name"].str();

        if ( "mask_position" in data )
        _mask_position = new TelegramMaskPosition(data["mask_position"]);

        if ( "file_size" in data )
        _file_size = data["file_size"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["file_id"] = _file_id;

        data["file_unique_id"] = _file_unique_id;

        data["width"] = _width;

        data["height"] = _height;

        data["is_animated"] = _is_animated;

        if ( _thumb !is null ) data["thumb"] = _thumb.getAsJson();

        if ( _emoji != "" ) data["emoji"] = _emoji;

        if ( _set_name != "" ) data["set_name"] = _set_name;

        if ( _mask_position !is null ) data["mask_position"] = _mask_position.getAsJson();

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

    /** Sticker width */
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

    /** Sticker height */
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

    /** <em>True</em>, if the sticker is animated */
    private bool _is_animated;
    /**
     * Getter for '_is_animated'
     * Returns: Current value of '_is_animated'
     */
    @property bool isAnimated () { return _is_animated; }
    /**
     * Setter for '_is_animated'
     * Params: isAnimatedNew = New value of '_is_animated'
     * Returns: New value of '_is_animated'
     */
    @property bool isAnimated ( bool isAnimatedNew ) { return _is_animated = isAnimatedNew; }

    /** <em>Optional</em>. Sticker thumbnail in the .WEBP or .JPG format */
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

    /** <em>Optional</em>. Emoji associated with the sticker */
    private string _emoji;
    /**
     * Getter for '_emoji'
     * Returns: Current value of '_emoji'
     */
    @property string emoji () { return _emoji; }
    /**
     * Setter for '_emoji'
     * Params: emojiNew = New value of '_emoji'
     * Returns: New value of '_emoji'
     */
    @property string emoji ( string emojiNew ) { return _emoji = emojiNew; }

    /** <em>Optional</em>. Name of the sticker set to which the sticker belongs */
    private string _set_name;
    /**
     * Getter for '_set_name'
     * Returns: Current value of '_set_name'
     */
    @property string setName () { return _set_name; }
    /**
     * Setter for '_set_name'
     * Params: setNameNew = New value of '_set_name'
     * Returns: New value of '_set_name'
     */
    @property string setName ( string setNameNew ) { return _set_name = setNameNew; }

    /** <em>Optional</em>. For mask stickers, the position where the mask should be placed */
    private TelegramMaskPosition _mask_position;
    /**
     * Getter for '_mask_position'
     * Returns: Current value of '_mask_position'
     */
    @property TelegramMaskPosition maskPosition () { return _mask_position; }
    /**
     * Setter for '_mask_position'
     * Params: maskPositionNew = New value of '_mask_position'
     * Returns: New value of '_mask_position'
     */
    @property TelegramMaskPosition maskPosition ( TelegramMaskPosition maskPositionNew ) { return _mask_position = maskPositionNew; }

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

