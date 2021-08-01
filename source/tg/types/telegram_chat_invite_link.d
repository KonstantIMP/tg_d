/**
 * Contains TelegramChatInviteLink
 */
module tg.types.telegram_chat_invite_link;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents an invite link for a chat.
 */
class TelegramChatInviteLink : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _invite_link = "";
        _creator = null;
        _is_primary = false;
        _is_revoked = false;
        _expire_date = 0;
        _member_limit = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "invite_link" !in data ) throw new TelegramException("Could not find reqired entry : invite_link");
        _invite_link = data["invite_link"].str();

        if ( "creator" !in data ) throw new TelegramException("Could not find reqired entry : creator");
        _creator = new TelegramUser(data["creator"]);

        if ( "is_primary" !in data ) throw new TelegramException("Could not find reqired entry : is_primary");
        _is_primary = data["is_primary"].boolean();

        if ( "is_revoked" !in data ) throw new TelegramException("Could not find reqired entry : is_revoked");
        _is_revoked = data["is_revoked"].boolean();

        if ( "expire_date" in data )
        _expire_date = data["expire_date"].integer();

        if ( "member_limit" in data )
        _member_limit = data["member_limit"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["invite_link"] = _invite_link;

        data["creator"] = _creator.getAsJson();

        data["is_primary"] = _is_primary;

        data["is_revoked"] = _is_revoked;

        if ( _expire_date != 0 ) data["expire_date"] = _expire_date;

        if ( _member_limit != 0 ) data["member_limit"] = _member_limit;

        return data;
    }

    /** The invite link. If the link was created by another chat administrator, then the second part of the link will be replaced with &#8220;&#8230;&#8221;. */
    private string _invite_link;
    /**
     * Getter for '_invite_link'
     * Returns: Current value of '_invite_link'
     */
    @property string inviteLink () { return _invite_link; }
    /**
     * Setter for '_invite_link'
     * Params: inviteLinkNew = New value of '_invite_link'
     * Returns: New value of '_invite_link'
     */
    @property string inviteLink ( string inviteLinkNew ) { return _invite_link = inviteLinkNew; }

    /** Creator of the link */
    private TelegramUser _creator;
    /**
     * Getter for '_creator'
     * Returns: Current value of '_creator'
     */
    @property TelegramUser creator () { return _creator; }
    /**
     * Setter for '_creator'
     * Params: creatorNew = New value of '_creator'
     * Returns: New value of '_creator'
     */
    @property TelegramUser creator ( TelegramUser creatorNew ) { return _creator = creatorNew; }

    /** True, if the link is primary */
    private bool _is_primary;
    /**
     * Getter for '_is_primary'
     * Returns: Current value of '_is_primary'
     */
    @property bool isPrimary () { return _is_primary; }
    /**
     * Setter for '_is_primary'
     * Params: isPrimaryNew = New value of '_is_primary'
     * Returns: New value of '_is_primary'
     */
    @property bool isPrimary ( bool isPrimaryNew ) { return _is_primary = isPrimaryNew; }

    /** True, if the link is revoked */
    private bool _is_revoked;
    /**
     * Getter for '_is_revoked'
     * Returns: Current value of '_is_revoked'
     */
    @property bool isRevoked () { return _is_revoked; }
    /**
     * Setter for '_is_revoked'
     * Params: isRevokedNew = New value of '_is_revoked'
     * Returns: New value of '_is_revoked'
     */
    @property bool isRevoked ( bool isRevokedNew ) { return _is_revoked = isRevokedNew; }

    /** <em>Optional</em>. Point in time (Unix timestamp) when the link will expire or has been expired */
    private ulong _expire_date;
    /**
     * Getter for '_expire_date'
     * Returns: Current value of '_expire_date'
     */
    @property ulong expireDate () { return _expire_date; }
    /**
     * Setter for '_expire_date'
     * Params: expireDateNew = New value of '_expire_date'
     * Returns: New value of '_expire_date'
     */
    @property ulong expireDate ( ulong expireDateNew ) { return _expire_date = expireDateNew; }

    /** <em>Optional</em>. Maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999 */
    private ulong _member_limit;
    /**
     * Getter for '_member_limit'
     * Returns: Current value of '_member_limit'
     */
    @property ulong memberLimit () { return _member_limit; }
    /**
     * Setter for '_member_limit'
     * Params: memberLimitNew = New value of '_member_limit'
     * Returns: New value of '_member_limit'
     */
    @property ulong memberLimit ( ulong memberLimitNew ) { return _member_limit = memberLimitNew; }
}

