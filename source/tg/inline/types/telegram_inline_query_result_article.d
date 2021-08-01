/**
 * Contains TelegramInlineQueryResultArticle
 */
module tg.inline.types.telegram_inline_query_result_article;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a link to an article or web page.
 */
class TelegramInlineQueryResultArticle : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _title = "";
        _input_message_content = null;
        _reply_markup = null;
        _url = "";
        _hide_url = false;
        _description = "";
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

        if ( "input_message_content" !in data ) throw new TelegramException("Could not find reqired entry : input_message_content");
        _input_message_content = new TelegramInputMessageContent(data["input_message_content"]);

        if ( "reply_markup" in data )
        _reply_markup = new TelegramInlineKeyboardMarkup(data["reply_markup"]);

        if ( "url" in data )
        _url = data["url"].str();

        if ( "hide_url" in data )
        _hide_url = data["hide_url"].boolean();

        if ( "description" in data )
        _description = data["description"].str();

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

        data["input_message_content"] = _input_message_content.getAsJson();

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        if ( _url != "" ) data["url"] = _url;

        data["hide_url"] = _hide_url;

        if ( _description != "" ) data["description"] = _description;

        if ( _thumb_url != "" ) data["thumb_url"] = _thumb_url;

        if ( _thumb_width != 0 ) data["thumb_width"] = _thumb_width;

        if ( _thumb_height != 0 ) data["thumb_height"] = _thumb_height;

        return data;
    }

    /** Type of the result, must be <em>article</em> */
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

    /** Unique identifier for this result, 1-64 Bytes */
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

    /** Title of the result */
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

    /** Content of the message to be sent */
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

    /** <em>Optional</em>. URL of the result */
    private string _url;
    /**
     * Getter for '_url'
     * Returns: Current value of '_url'
     */
    @property string url () { return _url; }
    /**
     * Setter for '_url'
     * Params: urlNew = New value of '_url'
     * Returns: New value of '_url'
     */
    @property string url ( string urlNew ) { return _url = urlNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if you don't want the URL to be shown in the message */
    private bool _hide_url;
    /**
     * Getter for '_hide_url'
     * Returns: Current value of '_hide_url'
     */
    @property bool hideUrl () { return _hide_url; }
    /**
     * Setter for '_hide_url'
     * Params: hideUrlNew = New value of '_hide_url'
     * Returns: New value of '_hide_url'
     */
    @property bool hideUrl ( bool hideUrlNew ) { return _hide_url = hideUrlNew; }

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

    /** <em>Optional</em>. Url of the thumbnail for the result */
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

