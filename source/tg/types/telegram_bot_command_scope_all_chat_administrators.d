/**
 * Contains TelegramBotCommandScopeAllChatAdministrators
 */
module tg.types.telegram_bot_command_scope_all_chat_administrators;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents the scope of bot commands, covering all group and supergroup chat administrators.
 */
class TelegramBotCommandScopeAllChatAdministrators : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        return data;
    }

    /** Scope type, must be <em>all_chat_administrators</em> */
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

