/**
 * Contains TelegramChatMemberBanned
 */
module tg.types.telegram_chat_member_banned;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a chat member that was banned in the chat and can't return to the chat or view chat messages.
 */
class TelegramChatMemberBanned : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _status = "";
        _user = null;
        _until_date = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "status" !in data ) throw new TelegramException("Could not find reqired entry : status");
        _status = data["status"].str();

        if ( "user" !in data ) throw new TelegramException("Could not find reqired entry : user");
        _user = new TelegramUser(data["user"]);

        if ( "until_date" !in data ) throw new TelegramException("Could not find reqired entry : until_date");
        _until_date = data["until_date"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["status"] = _status;

        data["user"] = _user.getAsJson();

        data["until_date"] = _until_date;

        return data;
    }

    /** The member's status in the chat, always &#8220;kicked&#8221; */
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

    /** Date when restrictions will be lifted for this user; unix time. If 0, then the user is banned forever */
    private ulong _until_date;
    /**
     * Getter for '_until_date'
     * Returns: Current value of '_until_date'
     */
    @property ulong untilDate () { return _until_date; }
    /**
     * Setter for '_until_date'
     * Params: untilDateNew = New value of '_until_date'
     * Returns: New value of '_until_date'
     */
    @property ulong untilDate ( ulong untilDateNew ) { return _until_date = untilDateNew; }
}

