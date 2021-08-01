/**
 * Contains TelegramVoiceChatStarted
 */
module tg.types.telegram_voice_chat_started;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a service message about a voice chat started in the chat. Currently holds no information
 */
class TelegramVoiceChatStarted : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        return data;
    }

}

