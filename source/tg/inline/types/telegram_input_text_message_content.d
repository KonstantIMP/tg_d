/**
 * Contains TelegramInputTextMessageContent
 */
module tg.inline.types.telegram_input_text_message_content;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents the content of a text message to be sent as the result of an inline query.
 */
class TelegramInputTextMessageContent : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _message_text = "";
        _parse_mode = "";
        _entities = null;
        _disable_web_page_preview = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "message_text" !in data ) throw new TelegramException("Could not find reqired entry : message_text");
        _message_text = data["message_text"].str();

        if ( "parse_mode" in data )
        _parse_mode = data["parse_mode"].str();

        if ( "entities" in data )
        _entities = new TelegramMessageEntity(data["entities"]);

        if ( "disable_web_page_preview" in data )
        _disable_web_page_preview = data["disable_web_page_preview"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["message_text"] = _message_text;

        if ( _parse_mode != "" ) data["parse_mode"] = _parse_mode;

        if ( _entities !is null ) data["entities"] = _entities.getAsJson();

        data["disable_web_page_preview"] = _disable_web_page_preview;

        return data;
    }

    /** Text of the message to be sent, 1-4096 characters */
    private string _message_text;
    /**
     * Getter for '_message_text'
     * Returns: Current value of '_message_text'
     */
    @property string messageText () { return _message_text; }
    /**
     * Setter for '_message_text'
     * Params: messageTextNew = New value of '_message_text'
     * Returns: New value of '_message_text'
     */
    @property string messageText ( string messageTextNew ) { return _message_text = messageTextNew; }

    /** <em>Optional</em>. Mode for parsing entities in the message text. See formatting options for more details. */
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

    /** <em>Optional</em>. List of special entities that appear in message text, which can be specified instead of <em>parse_mode</em> */
    private TelegramMessageEntity _entities;
    /**
     * Getter for '_entities'
     * Returns: Current value of '_entities'
     */
    @property TelegramMessageEntity entities () { return _entities; }
    /**
     * Setter for '_entities'
     * Params: entitiesNew = New value of '_entities'
     * Returns: New value of '_entities'
     */
    @property TelegramMessageEntity entities ( TelegramMessageEntity entitiesNew ) { return _entities = entitiesNew; }

    /** <em>Optional</em>. Disables link previews for links in the sent message */
    private bool _disable_web_page_preview;
    /**
     * Getter for '_disable_web_page_preview'
     * Returns: Current value of '_disable_web_page_preview'
     */
    @property bool disableWebPagePreview () { return _disable_web_page_preview; }
    /**
     * Setter for '_disable_web_page_preview'
     * Params: disableWebPagePreviewNew = New value of '_disable_web_page_preview'
     * Returns: New value of '_disable_web_page_preview'
     */
    @property bool disableWebPagePreview ( bool disableWebPagePreviewNew ) { return _disable_web_page_preview = disableWebPagePreviewNew; }
}

