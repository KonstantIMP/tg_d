/**
 * Contains TelegramVoiceChatParticipantsInvited
 */
module tg.types.telegram_voice_chat_participants_invited;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * This object represents a service message about new members invited to a voice chat.
 */
class TelegramVoiceChatParticipantsInvited : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _users = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "users" in data )
        _users = toTelegram!TelegramUser(data["users"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        if ( _users !is null ) data["users"] = _users.getAsJson();

        return data;
    }

    /** <em>Optional</em>. New members that were invited to the voice chat */
    private TelegramUser[] _users;
    /**
     * Getter for '_users'
     * Returns: Current value of '_users'
     */
    @property TelegramUser[] users () { return _users; }
    /**
     * Setter for '_users'
     * Params: usersNew = New value of '_users'
     * Returns: New value of '_users'
     */
    @property TelegramUser[] users ( TelegramUser[] usersNew ) { return _users = usersNew; }
}

