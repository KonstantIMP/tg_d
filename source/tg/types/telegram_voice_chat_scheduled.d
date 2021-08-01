/**
 * Contains TelegramVoiceChatScheduled
 */
module tg.types.telegram_voice_chat_scheduled;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a service message about a voice chat scheduled in the chat.
 */
class TelegramVoiceChatScheduled : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _start_date = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "start_date" !in data ) throw new TelegramException("Could not find reqired entry : start_date");
        _start_date = data["start_date"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["start_date"] = _start_date;

        return data;
    }

    /** Point in time (Unix timestamp) when the voice chat is supposed to be started by a chat administrator */
    private ulong _start_date;
    /**
     * Getter for '_start_date'
     * Returns: Current value of '_start_date'
     */
    @property ulong startDate () { return _start_date; }
    /**
     * Setter for '_start_date'
     * Params: startDateNew = New value of '_start_date'
     * Returns: New value of '_start_date'
     */
    @property ulong startDate ( ulong startDateNew ) { return _start_date = startDateNew; }
}

