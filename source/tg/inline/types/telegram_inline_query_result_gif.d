/**
 * Contains TelegramInlineQueryResultGif
 */
module tg.inline.types.telegram_inline_query_result_gif;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use <em>input_message_content</em> to send a message with the specified content instead of the animation.
 */
class TelegramInlineQueryResultGif : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _gif_url = "";
        _gif_width = 0;
        _gif_height = 0;
        _gif_duration = 0;
        _thumb_url = "";
        _thumb_mime_type = "";
        _title = "";
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

        if ( "gif_url" !in data ) throw new TelegramException("Could not find reqired entry : gif_url");
        _gif_url = data["gif_url"].str();

        if ( "gif_width" in data )
        _gif_width = data["gif_width"].integer();

        if ( "gif_height" in data )
        _gif_height = data["gif_height"].integer();

        if ( "gif_duration" in data )
        _gif_duration = data["gif_duration"].integer();

        if ( "thumb_url" !in data ) throw new TelegramException("Could not find reqired entry : thumb_url");
        _thumb_url = data["thumb_url"].str();

        if ( "thumb_mime_type" in data )
        _thumb_mime_type = data["thumb_mime_type"].str();

        if ( "title" in data )
        _title = data["title"].str();

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

        data["gif_url"] = _gif_url;

        if ( _gif_width != 0 ) data["gif_width"] = _gif_width;

        if ( _gif_height != 0 ) data["gif_height"] = _gif_height;

        if ( _gif_duration != 0 ) data["gif_duration"] = _gif_duration;

        data["thumb_url"] = _thumb_url;

        if ( _thumb_mime_type != "" ) data["thumb_mime_type"] = _thumb_mime_type;

        if ( _title != "" ) data["title"] = _title;

        if ( _caption != "" ) data["caption"] = _caption;

        if ( _parse_mode != "" ) data["parse_mode"] = _parse_mode;

        if ( _caption_entities !is null ) data["caption_entities"] = _caption_entities.getAsJson();

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        if ( _input_message_content !is null ) data["input_message_content"] = _input_message_content.getAsJson();

        return data;
    }

    /** Type of the result, must be <em>gif</em> */
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

    /** A valid URL for the GIF file. File size must not exceed 1MB */
    private string _gif_url;
    /**
     * Getter for '_gif_url'
     * Returns: Current value of '_gif_url'
     */
    @property string gifUrl () { return _gif_url; }
    /**
     * Setter for '_gif_url'
     * Params: gifUrlNew = New value of '_gif_url'
     * Returns: New value of '_gif_url'
     */
    @property string gifUrl ( string gifUrlNew ) { return _gif_url = gifUrlNew; }

    /** <em>Optional</em>. Width of the GIF */
    private ulong _gif_width;
    /**
     * Getter for '_gif_width'
     * Returns: Current value of '_gif_width'
     */
    @property ulong gifWidth () { return _gif_width; }
    /**
     * Setter for '_gif_width'
     * Params: gifWidthNew = New value of '_gif_width'
     * Returns: New value of '_gif_width'
     */
    @property ulong gifWidth ( ulong gifWidthNew ) { return _gif_width = gifWidthNew; }

    /** <em>Optional</em>. Height of the GIF */
    private ulong _gif_height;
    /**
     * Getter for '_gif_height'
     * Returns: Current value of '_gif_height'
     */
    @property ulong gifHeight () { return _gif_height; }
    /**
     * Setter for '_gif_height'
     * Params: gifHeightNew = New value of '_gif_height'
     * Returns: New value of '_gif_height'
     */
    @property ulong gifHeight ( ulong gifHeightNew ) { return _gif_height = gifHeightNew; }

    /** <em>Optional</em>. Duration of the GIF */
    private ulong _gif_duration;
    /**
     * Getter for '_gif_duration'
     * Returns: Current value of '_gif_duration'
     */
    @property ulong gifDuration () { return _gif_duration; }
    /**
     * Setter for '_gif_duration'
     * Params: gifDurationNew = New value of '_gif_duration'
     * Returns: New value of '_gif_duration'
     */
    @property ulong gifDuration ( ulong gifDurationNew ) { return _gif_duration = gifDurationNew; }

    /** URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the result */
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

    /** <em>Optional</em>. MIME type of the thumbnail, must be one of &#8220;image/jpeg&#8221;, &#8220;image/gif&#8221;, or &#8220;video/mp4&#8221;. Defaults to &#8220;image/jpeg&#8221; */
    private string _thumb_mime_type;
    /**
     * Getter for '_thumb_mime_type'
     * Returns: Current value of '_thumb_mime_type'
     */
    @property string thumbMimeType () { return _thumb_mime_type; }
    /**
     * Setter for '_thumb_mime_type'
     * Params: thumbMimeTypeNew = New value of '_thumb_mime_type'
     * Returns: New value of '_thumb_mime_type'
     */
    @property string thumbMimeType ( string thumbMimeTypeNew ) { return _thumb_mime_type = thumbMimeTypeNew; }

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

    /** <em>Optional</em>. Caption of the GIF file to be sent, 0-1024 characters after entities parsing */
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

    /** <em>Optional</em>. Mode for parsing entities in the caption. See formatting options for more details. */
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

    /** <em>Optional</em>. Content of the message to be sent instead of the GIF animation */
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

