/**
 * Contains TelegramChatMemberMember
 */
module tg.types.telegram_chat_member_member;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a chat member that has no additional privileges or restrictions.
 */
class TelegramChatMemberMember : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _status = "";
        _user = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "status" !in data ) throw new TelegramException("Could not find reqired entry : status");
        _status = data["status"].str();

        if ( "user" !in data ) throw new TelegramException("Could not find reqired entry : user");
        _user = new TelegramUser(data["user"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["status"] = _status;

        data["user"] = _user.getAsJson();

        return data;
    }

    /** The member's status in the chat, always &#8220;member&#8221; */
    private string _status;
    /**
     * Getter for '_status'
     * Returns: Current value of '_status'
     */
    @property string status () { return _status; }
    /**
     * Setter for '_status'
     * Params: statusNew = New value of '_status'
     * Returns: New value of '_status'
     */
    @property string status ( string statusNew ) { return _status = statusNew; }

    /** Information about the user */
    private TelegramUser _user;
    /**
     * Getter for '_user'
     * Returns: Current value of '_user'
     */
    @property TelegramUser user () { return _user; }
    /**
     * Setter for '_user'
     * Params: userNew = New value of '_user'
     * Returns: New value of '_user'
     */
    @property TelegramUser user ( TelegramUser userNew ) { return _user = userNew; }
}

