/**
 * Contains TelegramCallbackGame
 */
module tg.game.types.telegram_callback_game;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * A placeholder, currently holds no information. Use BotFather to set up your game.
 */
class TelegramCallbackGame : TelegramType {
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

