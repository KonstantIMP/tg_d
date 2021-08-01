/**
 * Contains TelegramInlineQueryResultDocument
 */
module tg.inline.types.telegram_inline_query_result_document;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use <em>input_message_content</em> to send a message with the specified content instead of the file. Currently, only <strong>.PDF</strong> and <strong>.ZIP</strong> files can be sent using this method.
 */
class TelegramInlineQueryResultDocument : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _title = "";
        _caption = "";
        _parse_mode = "";
        _caption_entities = null;
        _document_url = "";
        _mime_type = "";
        _description = "";
        _reply_markup = null;
        _input_message_content = null;
        _thumb_url = "";
        _thumb_width = 0;
        _thumb_height = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "title" !in data ) throw new TelegramException("Could not find reqired entry : title");
        _title = data["title"].str();

        if ( "caption" in data )
        _caption = data["caption"].str();

        if ( "parse_mode" in data )
        _parse_mode = data["parse_mode"].str();

        if ( "caption_entities" in data )
        _caption_entities = new TelegramMessageEntity(data["caption_entities"]);

        if ( "document_url" !in data ) throw new TelegramException("Could not find reqired entry : document_url");
        _document_url = data["document_url"].str();

        if ( "mime_type" !in data ) throw new TelegramException("Could not find reqired entry : mime_type");
        _mime_type = data["mime_type"].str();

        if ( "description" in data )
        _description = data["description"].str();

        if ( "reply_markup" in data )
        _reply_markup = new TelegramInlineKeyboardMarkup(data["reply_markup"]);

        if ( "input_message_content" in data )
        _input_message_content = new TelegramInputMessageContent(data["input_message_content"]);

        if ( "thumb_url" in data )
        _thumb_url = data["thumb_url"].str();

        if ( "thumb_width" in data )
        _thumb_width = data["thumb_width"].integer();

        if ( "thumb_height" in data )
        _thumb_height = data["thumb_height"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["id"] = _id;

        data["title"] = _title;

        if ( _caption != "" ) data["caption"] = _caption;

        if ( _parse_mode != "" ) data["parse_mode"] = _parse_mode;

        if ( _caption_entities !is null ) data["caption_entities"] = _caption_entities.getAsJson();

        data["document_url"] = _document_url;

        data["mime_type"] = _mime_type;

        if ( _description != "" ) data["description"] = _description;

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        if ( _input_message_content !is null ) data["input_message_content"] = _input_message_content.getAsJson();

        if ( _thumb_url != "" ) data["thumb_url"] = _thumb_url;

        if ( _thumb_width != 0 ) data["thumb_width"] = _thumb_width;

        if ( _thumb_height != 0 ) data["thumb_height"] = _thumb_height;

        return data;
    }

    /** Type of the result, must be <em>document</em> */
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

    /** Title for the result */
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

    /** <em>Optional</em>. Caption of the document to be sent, 0-1024 characters after entities parsing */
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

    /** <em>Optional</em>. Mode for parsing entities in the document caption. See formatting options for more details. */
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

    /** A valid URL for the file */
    private string _document_url;
    /**
     * Getter for '_document_url'
     * Returns: Current value of '_document_url'
     */
    @property string documentUrl () { return _document_url; }
    /**
     * Setter for '_document_url'
     * Params: documentUrlNew = New value of '_document_url'
     * Returns: New value of '_document_url'
     */
    @property string documentUrl ( string documentUrlNew ) { return _document_url = documentUrlNew; }

    /** Mime type of the content of the file, either &#8220;application/pdf&#8221; or &#8220;application/zip&#8221; */
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

    /** <em>Optional</em>. Content of the message to be sent instead of the file */
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

    /** <em>Optional</em>. URL of the thumbnail (jpeg only) for the file */
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

    /** <em>Optional</em>. Thumbnail width */
    private ulong _thumb_width;
    /**
     * Getter for '_thumb_width'
     * Returns: Current value of '_thumb_width'
     */
    @property ulong thumbWidth () { return _thumb_width; }
    /**
     * Setter for '_thumb_width'
     * Params: thumbWidthNew = New value of '_thumb_width'
     * Returns: New value of '_thumb_width'
     */
    @property ulong thumbWidth ( ulong thumbWidthNew ) { return _thumb_width = thumbWidthNew; }

    /** <em>Optional</em>. Thumbnail height */
    private ulong _thumb_height;
    /**
     * Getter for '_thumb_height'
     * Returns: Current value of '_thumb_height'
     */
    @property ulong thumbHeight () { return _thumb_height; }
    /**
     * Setter for '_thumb_height'
     * Params: thumbHeightNew = New value of '_thumb_height'
     * Returns: New value of '_thumb_height'
     */
    @property ulong thumbHeight ( ulong thumbHeightNew ) { return _thumb_height = thumbHeightNew; }
}

