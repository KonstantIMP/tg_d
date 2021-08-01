/**
 * Contains TelegramInlineQueryResultPhoto
 */
module tg.inline.types.telegram_inline_query_result_photo;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use <em>input_message_content</em> to send a message with the specified content instead of the photo.
 */
class TelegramInlineQueryResultPhoto : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _photo_url = "";
        _thumb_url = "";
        _photo_width = 0;
        _photo_height = 0;
        _title = "";
        _description = "";
        _caption = "";
        _parse_mode = "";
        _caption_entities = null;
        _reply_markup = null;
        _input_message_content = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "photo_url" !in data ) throw new TelegramException("Could not find reqired entry : photo_url");
        _photo_url = data["photo_url"].str();

        if ( "thumb_url" !in data ) throw new TelegramException("Could not find reqired entry : thumb_url");
        _thumb_url = data["thumb_url"].str();

        if ( "photo_width" in data )
        _photo_width = data["photo_width"].integer();

        if ( "photo_height" in data )
        _photo_height = data["photo_height"].integer();

        if ( "title" in data )
        _title = data["title"].str();

        if ( "description" in data )
        _description = data["description"].str();

        if ( "caption" in data )
        _caption = data["caption"].str();

        if ( "parse_mode" in data )
        _parse_mode = data["parse_mode"].str();

        if ( "caption_entities" in data )
        _caption_entities = toTelegram!TelegramMessageEntity(data["caption_entities"]);

        if ( "reply_markup" in data )
        _reply_markup = new TelegramInlineKeyboardMarkup(data["reply_markup"]);

        if ( "input_message_content" in data )
        _input_message_content = new TelegramInputMessageContent(data["input_message_content"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["id"] = _id;

        data["photo_url"] = _photo_url;

        data["thumb_url"] = _thumb_url;

        if ( _photo_width != 0 ) data["photo_width"] = _photo_width;

        if ( _photo_height != 0 ) data["photo_height"] = _photo_height;

        if ( _title != "" ) data["title"] = _title;

        if ( _description != "" ) data["description"] = _description;

        if ( _caption != "" ) data["caption"] = _caption;

        if ( _parse_mode != "" ) data["parse_mode"] = _parse_mode;

        if ( _caption_entities !is null ) data["caption_entities"] = _caption_entities.getAsJson();

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        if ( _input_message_content !is null ) data["input_message_content"] = _input_message_content.getAsJson();

        return data;
    }

    /** Type of the result, must be <em>photo</em> */
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

    /** Unique identifier for this result, 1-64 bytes */
    private string _id;
    /**
     * Getter for '_id'
     * Returns: Current value of '_id'
     */
    @property string id () { return _id; }
    /**
     * Setter for '_id'
     * Params: idNew = New value of '_id'
     * Returns: New value of '_id'
     */
    @property string id ( string idNew ) { return _id = idNew; }

    /** A valid URL of the photo. Photo must be in <strong>jpeg</strong> format. Photo size must not exceed 5MB */
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

    /** URL of the thumbnail for the photo */
    private string _thumb_url;
    /**
     * Getter for '_thumb_url'
     * Returns: Current value of '_thumb_url'
     */
    @property string thumbUrl () { return _thumb_url; }
    /**
     * Setter for '_thumb_url'
     * Params: thumbUrlNew = New value of '_thumb_url'
     * Returns: New value of '_thumb_url'
     */
    @property string thumbUrl ( string thumbUrlNew ) { return _thumb_url = thumbUrlNew; }

    /** <em>Optional</em>. Width of the photo */
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

    /** <em>Optional</em>. Height of the photo */
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

    /** <em>Optional</em>. Title for the result */
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

    /** <em>Optional</em>. Short description of the result */
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

    /** <em>Optional</em>. Caption of the photo to be sent, 0-1024 characters after entities parsing */
    private string _caption;
    /**
     * Getter for '_caption'
     * Returns: Current value of '_caption'
     */
    @property string caption () { return _caption; }
    /**
     * Setter for '_caption'
     * Params: captionNew = New value of '_caption'
     * Returns: New value of '_caption'
     */
    @property string caption ( string captionNew ) { return _caption = captionNew; }

    /** <em>Optional</em>. Mode for parsing entities in the photo caption. See formatting options for more details. */
    private string _parse_mode;
    /**
     * Getter for '_parse_mode'
     * Returns: Current value of '_parse_mode'
     */
    @property string parseMode () { return _parse_mode; }
    /**
     * Setter for '_parse_mode'
     * Params: parseModeNew = New value of '_parse_mode'
     * Returns: New value of '_parse_mode'
     */
    @property string parseMode ( string parseModeNew ) { return _parse_mode = parseModeNew; }

    /** <em>Optional</em>. List of special entities that appear in the caption, which can be specified instead of <em>parse_mode</em> */
    private TelegramMessageEntity[] _caption_entities;
    /**
     * Getter for '_caption_entities'
     * Returns: Current value of '_caption_entities'
     */
    @property TelegramMessageEntity[] captionEntities () { return _caption_entities; }
    /**
     * Setter for '_caption_entities'
     * Params: captionEntitiesNew = New value of '_caption_entities'
     * Returns: New value of '_caption_entities'
     */
    @property TelegramMessageEntity[] captionEntities ( TelegramMessageEntity[] captionEntitiesNew ) { return _caption_entities = captionEntitiesNew; }

    /** <em>Optional</em>. Inline keyboard attached to the message */
    private TelegramInlineKeyboardMarkup _reply_markup;
    /**
     * Getter for '_reply_markup'
     * Returns: Current value of '_reply_markup'
     */
    @property TelegramInlineKeyboardMarkup replyMarkup () { return _reply_markup; }
    /**
     * Setter for '_reply_markup'
     * Params: replyMarkupNew = New value of '_reply_markup'
     * Returns: New value of '_reply_markup'
     */
    @property TelegramInlineKeyboardMarkup replyMarkup ( TelegramInlineKeyboardMarkup replyMarkupNew ) { return _reply_markup = replyMarkupNew; }

    /** <em>Optional</em>. Content of the message to be sent instead of the photo */
    private TelegramInputMessageContent _input_message_content;
    /**
     * Getter for '_input_message_content'
     * Returns: Current value of '_input_message_content'
     */
    @property TelegramInputMessageContent inputMessageContent () { return _input_message_content; }
    /**
     * Setter for '_input_message_content'
     * Params: inputMessageContentNew = New value of '_input_message_content'
     * Returns: New value of '_input_message_content'
     */
    @property TelegramInputMessageContent inputMessageContent ( TelegramInputMessageContent inputMessageContentNew ) { return _input_message_content = inputMessageContentNew; }
}

