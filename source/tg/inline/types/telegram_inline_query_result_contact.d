/**
 * Contains TelegramInlineQueryResultContact
 */
module tg.inline.types.telegram_inline_query_result_contact;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use <em>input_message_content</em> to send a message with the specified content instead of the contact.
 */
class TelegramInlineQueryResultContact : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _phone_number = "";
        _first_name = "";
        _last_name = "";
        _vcard = "";
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

        if ( "phone_number" !in data ) throw new TelegramException("Could not find reqired entry : phone_number");
        _phone_number = data["phone_number"].str();

        if ( "first_name" !in data ) throw new TelegramException("Could not find reqired entry : first_name");
        _first_name = data["first_name"].str();

        if ( "last_name" in data )
        _last_name = data["last_name"].str();

        if ( "vcard" in data )
        _vcard = data["vcard"].str();

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

        data["phone_number"] = _phone_number;

        data["first_name"] = _first_name;

        if ( _last_name != "" ) data["last_name"] = _last_name;

        if ( _vcard != "" ) data["vcard"] = _vcard;

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        if ( _input_message_content !is null ) data["input_message_content"] = _input_message_content.getAsJson();

        if ( _thumb_url != "" ) data["thumb_url"] = _thumb_url;

        if ( _thumb_width != 0 ) data["thumb_width"] = _thumb_width;

        if ( _thumb_height != 0 ) data["thumb_height"] = _thumb_height;

        return data;
    }

    /** Type of the result, must be <em>contact</em> */
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

    /** Contact's phone number */
    private string _phone_number;
    /**
     * Getter for '_phone_number'
     * Returns: Current value of '_phone_number'
     */
    @property string phoneNumber () { return _phone_number; }
    /**
     * Setter for '_phone_number'
     * Params: phoneNumberNew = New value of '_phone_number'
     * Returns: New value of '_phone_number'
     */
    @property string phoneNumber ( string phoneNumberNew ) { return _phone_number = phoneNumberNew; }

    /** Contact's first name */
    private string _first_name;
    /**
     * Getter for '_first_name'
     * Returns: Current value of '_first_name'
     */
    @property string firstName () { return _first_name; }
    /**
     * Setter for '_first_name'
     * Params: firstNameNew = New value of '_first_name'
     * Returns: New value of '_first_name'
     */
    @property string firstName ( string firstNameNew ) { return _first_name = firstNameNew; }

    /** <em>Optional</em>. Contact's last name */
    private string _last_name;
    /**
     * Getter for '_last_name'
     * Returns: Current value of '_last_name'
     */
    @property string lastName () { return _last_name; }
    /**
     * Setter for '_last_name'
     * Params: lastNameNew = New value of '_last_name'
     * Returns: New value of '_last_name'
     */
    @property string lastName ( string lastNameNew ) { return _last_name = lastNameNew; }

    /** <em>Optional</em>. Additional data about the contact in the form of a vCard, 0-2048 bytes */
    private string _vcard;
    /**
     * Getter for '_vcard'
     * Returns: Current value of '_vcard'
     */
    @property string vcard () { return _vcard; }
    /**
     * Setter for '_vcard'
     * Params: vcardNew = New value of '_vcard'
     * Returns: New value of '_vcard'
     */
    @property string vcard ( string vcardNew ) { return _vcard = vcardNew; }

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

    /** <em>Optional</em>. Content of the message to be sent instead of the contact */
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

