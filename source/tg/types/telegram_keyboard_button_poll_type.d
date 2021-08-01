/**
 * Contains TelegramKeyboardButtonPollType
 */
module tg.types.telegram_keyboard_button_poll_type;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents type of a poll, which is allowed to be created and sent when the corresponding button is pressed.
 */
class TelegramKeyboardButtonPollType : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" in data )
        _type = data["type"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        if ( _type != "" ) data["type"] = _type;

        return data;
    }

    /** <em>Optional</em>. If <em>quiz</em> is passed, the user will be allowed to create only polls in the quiz mode. If <em>regular</em> is passed, only regular polls will be allowed. Otherwise, the user will be allowed to create a poll of any type. */
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
}

