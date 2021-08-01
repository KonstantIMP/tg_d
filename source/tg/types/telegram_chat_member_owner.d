/**
 * Contains TelegramChatMemberOwner
 */
module tg.types.telegram_chat_member_owner;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a chat member that owns the chat and has all administrator privileges.
 */
class TelegramChatMemberOwner : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _status = "";
        _user = null;
        _is_anonymous = false;
        _custom_title = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "status" !in data ) throw new TelegramException("Could not find reqired entry : status");
        _status = data["status"].str();

        if ( "user" !in data ) throw new TelegramException("Could not find reqired entry : user");
        _user = new TelegramUser(data["user"]);

        if ( "is_anonymous" !in data ) throw new TelegramException("Could not find reqired entry : is_anonymous");
        _is_anonymous = data["is_anonymous"].boolean();

        if ( "custom_title" in data )
        _custom_title = data["custom_title"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["status"] = _status;

        data["user"] = _user.getAsJson();

        data["is_anonymous"] = _is_anonymous;

        if ( _custom_title != "" ) data["custom_title"] = _custom_title;

        return data;
    }

    /** The member's status in the chat, always &#8220;creator&#8221; */
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

    /** True, if the user's presence in the chat is hidden */
    private bool _is_anonymous;
    /**
     * Getter for '_is_anonymous'
     * Returns: Current value of '_is_anonymous'
     */
    @property bool isAnonymous () { return _is_anonymous; }
    /**
     * Setter for '_is_anonymous'
     * Params: isAnonymousNew = New value of '_is_anonymous'
     * Returns: New value of '_is_anonymous'
     */
    @property bool isAnonymous ( bool isAnonymousNew ) { return _is_anonymous = isAnonymousNew; }

    /** <em>Optional</em>. Custom title for this user */
    private string _custom_title;
    /**
     * Getter for '_custom_title'
     * Returns: Current value of '_custom_title'
     */
    @property string customTitle () { return _custom_title; }
    /**
     * Setter for '_custom_title'
     * Params: customTitleNew = New value of '_custom_title'
     * Returns: New value of '_custom_title'
     */
    @property string customTitle ( string customTitleNew ) { return _custom_title = customTitleNew; }
}

