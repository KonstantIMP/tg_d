/**
 * Contains TelegramVoiceChatEnded
 */
module tg.types.telegram_voice_chat_ended;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a service message about a voice chat ended in the chat.
 */
class TelegramVoiceChatEnded : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _duration = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "duration" !in data ) throw new TelegramException("Could not find reqired entry : duration");
        _duration = data["duration"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["duration"] = _duration;

        return data;
    }

    /** Voice chat duration; in seconds */
    private ulong _duration;
    /**
     * Getter for '_duration'
     * Returns: Current value of '_duration'
     */
    @property ulong duration () { return _duration; }
    /**
     * Setter for '_duration'
     * Params: durationNew = New value of '_duration'
     * Returns: New value of '_duration'
     */
    @property ulong duration ( ulong durationNew ) { return _duration = durationNew; }
}

