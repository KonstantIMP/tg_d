/**
 * Contains TelegramBotCommandScopeChatMember
 */
module tg.types.telegram_bot_command_scope_chat_member;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents the scope of bot commands, covering a specific member of a group or supergroup chat.
 */
class TelegramBotCommandScopeChatMember : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _chat_id = "";
        _user_id = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "chat_id" !in data ) throw new TelegramException("Could not find reqired entry : chat_id");
        _chat_id = data["chat_id"].str();

        if ( "user_id" !in data ) throw new TelegramException("Could not find reqired entry : user_id");
        _user_id = data["user_id"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["chat_id"] = _chat_id;

        data["user_id"] = _user_id;

        return data;
    }

    /** Scope type, must be <em>chat_member</em> */
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

    /** Unique identifier of the target user */
    private ulong _user_id;
    /**
     * Getter for '_user_id'
     * Returns: Current value of '_user_id'
     */
    @property ulong userId () { return _user_id; }
    /**
     * Setter for '_user_id'
     * Params: userIdNew = New value of '_user_id'
     * Returns: New value of '_user_id'
     */
    @property ulong userId ( ulong userIdNew ) { return _user_id = userIdNew; }
}

