/**
 * Contains TelegramMessageAutoDeleteTimerChanged
 */
module tg.types.telegram_message_auto_delete_timer_changed;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a service message about a change in auto-delete timer settings.
 */
class TelegramMessageAutoDeleteTimerChanged : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _message_auto_delete_time = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "message_auto_delete_time" !in data ) throw new TelegramException("Could not find reqired entry : message_auto_delete_time");
        _message_auto_delete_time = data["message_auto_delete_time"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["message_auto_delete_time"] = _message_auto_delete_time;

        return data;
    }

    /** New auto-delete time for messages in the chat */
    private ulong _message_auto_delete_time;
    /**
     * Getter for '_message_auto_delete_time'
     * Returns: Current value of '_message_auto_delete_time'
     */
    @property ulong messageAutoDeleteTime () { return _message_auto_delete_time; }
    /**
     * Setter for '_message_auto_delete_time'
     * Params: messageAutoDeleteTimeNew = New value of '_message_auto_delete_time'
     * Returns: New value of '_message_auto_delete_time'
     */
    @property ulong messageAutoDeleteTime ( ulong messageAutoDeleteTimeNew ) { return _message_auto_delete_time = messageAutoDeleteTimeNew; }
}

