/**
 * Contains TelegramInlineQueryResultCachedGif
 */
module tg.inline.types.telegram_inline_query_result_cached_gif;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use <em>input_message_content</em> to send a message with specified content instead of the animation.
 */
class TelegramInlineQueryResultCachedGif : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _gif_file_id = "";
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

        if ( "gif_file_id" !in data ) throw new TelegramException("Could not find reqired entry : gif_file_id");
        _gif_file_id = data["gif_file_id"].str();

        if ( "title" in data )
        _title = data["title"].str();

        if ( "caption" in data )
        _caption = data["caption"].str();

        if ( "parse_mode" in data )
        _parse_mode = data["parse_mode"].str();

        if ( "caption_entities" in data )
        _caption_entities = new TelegramMessageEntity(data["caption_entities"]);

        if ( "reply_markup" in data )
        _reply_markup = new TelegramInlineKeyboardMarkup(data["reply_markup"]);

        if ( "input_message_content" in data )
        _input_message_content = new TelegramInputMessageContent(data["input_message_content"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["id"] = _id;

        data["gif_file_id"] = _gif_file_id;

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

    /** A valid file identifier for the GIF file */
    private string _gif_file_id;
    /**
     * Getter for '_gif_file_id'
     * Returns: Current value of '_gif_file_id'
     */
    @property string gifFileId () { return _gif_file_id; }
    /**
     * Setter for '_gif_file_id'
     * Params: gifFileIdNew = New value of '_gif_file_id'
     * Returns: New value of '_gif_file_id'
     */
    @property string gifFileId ( string gifFileIdNew ) { return _gif_file_id = gifFileIdNew; }

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
    private TelegramMessageEntity _caption_entities;
    /**
     * Getter for '_caption_entities'
     * Returns: Current value of '_caption_entities'
     */
    @property TelegramMessageEntity captionEntities () { return _caption_entities; }
    /**
     * Setter for '_caption_entities'
     * Params: captionEntitiesNew = New value of '_caption_entities'
     * Returns: New value of '_caption_entities'
     */
    @property TelegramMessageEntity captionEntities ( TelegramMessageEntity captionEntitiesNew ) { return _caption_entities = captionEntitiesNew; }

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

