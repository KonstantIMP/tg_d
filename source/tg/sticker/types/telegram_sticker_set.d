/**
 * Contains TelegramStickerSet
 */
module tg.sticker.types.telegram_sticker_set;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a sticker set.
 */
class TelegramStickerSet : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _name = "";
        _title = "";
        _is_animated = false;
        _contains_masks = false;
        _stickers = null;
        _thumb = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "name" !in data ) throw new TelegramException("Could not find reqired entry : name");
        _name = data["name"].str();

        if ( "title" !in data ) throw new TelegramException("Could not find reqired entry : title");
        _title = data["title"].str();

        if ( "is_animated" !in data ) throw new TelegramException("Could not find reqired entry : is_animated");
        _is_animated = data["is_animated"].boolean();

        if ( "contains_masks" !in data ) throw new TelegramException("Could not find reqired entry : contains_masks");
        _contains_masks = data["contains_masks"].boolean();

        if ( "stickers" !in data ) throw new TelegramException("Could not find reqired entry : stickers");
        _stickers = new TelegramSticker(data["stickers"]);

        if ( "thumb" in data )
        _thumb = new TelegramPhotoSize(data["thumb"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["name"] = _name;

        data["title"] = _title;

        data["is_animated"] = _is_animated;

        data["contains_masks"] = _contains_masks;

        data["stickers"] = _stickers.getAsJson();

        if ( _thumb !is null ) data["thumb"] = _thumb.getAsJson();

        return data;
    }

    /** Sticker set name */
    private string _name;
    /**
     * Getter for '_name'
     * Returns: Current value of '_name'
     */
    @property string name () { return _name; }
    /**
     * Setter for '_name'
     * Params: nameNew = New value of '_name'
     * Returns: New value of '_name'
     */
    @property string name ( string nameNew ) { return _name = nameNew; }

    /** Sticker set title */
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

    /** <em>True</em>, if the sticker set contains animated stickers */
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

    /** <em>True</em>, if the sticker set contains masks */
    private bool _contains_masks;
    /**
     * Getter for '_contains_masks'
     * Returns: Current value of '_contains_masks'
     */
    @property bool containsMasks () { return _contains_masks; }
    /**
     * Setter for '_contains_masks'
     * Params: containsMasksNew = New value of '_contains_masks'
     * Returns: New value of '_contains_masks'
     */
    @property bool containsMasks ( bool containsMasksNew ) { return _contains_masks = containsMasksNew; }

    /** List of all set stickers */
    private TelegramSticker _stickers;
    /**
     * Getter for '_stickers'
     * Returns: Current value of '_stickers'
     */
    @property TelegramSticker stickers () { return _stickers; }
    /**
     * Setter for '_stickers'
     * Params: stickersNew = New value of '_stickers'
     * Returns: New value of '_stickers'
     */
    @property TelegramSticker stickers ( TelegramSticker stickersNew ) { return _stickers = stickersNew; }

    /** <em>Optional</em>. Sticker set thumbnail in the .WEBP or .TGS format */
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
}

