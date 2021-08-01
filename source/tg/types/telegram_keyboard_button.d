/**
 * Contains TelegramKeyboardButton
 */
module tg.types.telegram_keyboard_button;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents one button of the reply keyboard. For simple text buttons <em>String</em> can be used instead of this object to specify text of the button. Optional fields <em>request_contact</em>, <em>request_location</em>, and <em>request_poll</em> are mutually exclusive.
 */
class TelegramKeyboardButton : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _text = "";
        _request_contact = false;
        _request_location = false;
        _request_poll = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "text" in data )
        _text = data["text"].str();

        if ( "request_contact" in data )
        _request_contact = data["request_contact"].boolean();

        if ( "request_location" in data )
        _request_location = data["request_location"].boolean();

        if ( "request_poll" in data )
        _request_poll = new TelegramKeyboardButtonPollType(data["request_poll"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        if ( _text != "" ) data["text"] = _text;

        data["request_contact"] = _request_contact;

        data["request_location"] = _request_location;

        if ( _request_poll !is null ) data["request_poll"] = _request_poll.getAsJson();

        return data;
    }

    /** Text of the button. If none of the optional fields are used, it will be sent as a message when the button is pressed */
    private string _text;
    /**
     * Getter for '_text'
     * Returns: Current value of '_text'
     */
    @property string text () { return _text; }
    /**
     * Setter for '_text'
     * Params: textNew = New value of '_text'
     * Returns: New value of '_text'
     */
    @property string text ( string textNew ) { return _text = textNew; }

    /** <em>Optional</em>. If <em>True</em>, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only */
    private bool _request_contact;
    /**
     * Getter for '_request_contact'
     * Returns: Current value of '_request_contact'
     */
    @property bool requestContact () { return _request_contact; }
    /**
     * Setter for '_request_contact'
     * Params: requestContactNew = New value of '_request_contact'
     * Returns: New value of '_request_contact'
     */
    @property bool requestContact ( bool requestContactNew ) { return _request_contact = requestContactNew; }

    /** <em>Optional</em>. If <em>True</em>, the user's current location will be sent when the button is pressed. Available in private chats only */
    private bool _request_location;
    /**
     * Getter for '_request_location'
     * Returns: Current value of '_request_location'
     */
    @property bool requestLocation () { return _request_location; }
    /**
     * Setter for '_request_location'
     * Params: requestLocationNew = New value of '_request_location'
     * Returns: New value of '_request_location'
     */
    @property bool requestLocation ( bool requestLocationNew ) { return _request_location = requestLocationNew; }

    /** <em>Optional</em>. If specified, the user will be asked to create a poll and send it to the bot when the button is pressed. Available in private chats only */
    private TelegramKeyboardButtonPollType _request_poll;
    /**
     * Getter for '_request_poll'
     * Returns: Current value of '_request_poll'
     */
    @property TelegramKeyboardButtonPollType requestPoll () { return _request_poll; }
    /**
     * Setter for '_request_poll'
     * Params: requestPollNew = New value of '_request_poll'
     * Returns: New value of '_request_poll'
     */
    @property TelegramKeyboardButtonPollType requestPoll ( TelegramKeyboardButtonPollType requestPollNew ) { return _request_poll = requestPollNew; }
}

