/**
 * Contains TelegramBotCommandScopeChatAdministrators
 */
module tg.types.telegram_bot_command_scope_chat_administrators;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents the scope of bot commands, covering all administrators of a specific group or supergroup chat.
 */
class TelegramBotCommandScopeChatAdministrators : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _chat_id = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "chat_id" !in data ) throw new TelegramException("Could not find reqired entry : chat_id");
        _chat_id = data["chat_id"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["chat_id"] = _chat_id;

        return data;
    }

    /** Scope type, must be <em>chat_administrators</em> */
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

    /** Unique identifier for the target chat or username of the target supergroup (in the format <code>@supergroupusername</code>) */
    private string _chat_id;
    /**
     * Getter for '_chat_id'
     * Returns: Current value of '_chat_id'
     */
    @property string chatId () { return _chat_id; }
    /**
     * Setter for '_chat_id'
     * Params: chatIdNew = New value of '_chat_id'
     * Returns: New value of '_chat_id'
     */
    @property string chatId ( string chatIdNew ) { return _chat_id = chatIdNew; }
}

