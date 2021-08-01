/**
 * Contains TelegramMessageId
 */
module tg.types.telegram_message_id;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a unique message identifier.
 */
class TelegramMessageId : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _message_id = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "message_id" !in data ) throw new TelegramException("Could not find reqired entry : message_id");
        _message_id = data["message_id"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["message_id"] = _message_id;

        return data;
    }

    /** Unique message identifier */
    private ulong _message_id;
    /**
     * Getter for '_message_id'
     * Returns: Current value of '_message_id'
     */
    @property ulong messageId () { return _message_id; }
    /**
     * Setter for '_message_id'
     * Params: messageIdNew = New value of '_message_id'
     * Returns: New value of '_message_id'
     */
    @property ulong messageId ( ulong messageIdNew ) { return _message_id = messageIdNew; }
}

