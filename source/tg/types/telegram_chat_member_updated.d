/**
 * Contains TelegramChatMemberUpdated
 */
module tg.types.telegram_chat_member_updated;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents changes in the status of a chat member.
 */
class TelegramChatMemberUpdated : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _chat = null;
        _from = null;
        _date = 0;
        _old_chat_member = null;
        _new_chat_member = null;
        _invite_link = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "chat" !in data ) throw new TelegramException("Could not find reqired entry : chat");
        _chat = new TelegramChat(data["chat"]);

        if ( "from" !in data ) throw new TelegramException("Could not find reqired entry : from");
        _from = new TelegramUser(data["from"]);

        if ( "date" !in data ) throw new TelegramException("Could not find reqired entry : date");
        _date = data["date"].integer();

        if ( "old_chat_member" !in data ) throw new TelegramException("Could not find reqired entry : old_chat_member");
        _old_chat_member = new TelegramChatMember(data["old_chat_member"]);

        if ( "new_chat_member" !in data ) throw new TelegramException("Could not find reqired entry : new_chat_member");
        _new_chat_member = new TelegramChatMember(data["new_chat_member"]);

        if ( "invite_link" in data )
        _invite_link = new TelegramChatInviteLink(data["invite_link"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["chat"] = _chat.getAsJson();

        data["from"] = _from.getAsJson();

        data["date"] = _date;

        data["old_chat_member"] = _old_chat_member.getAsJson();

        data["new_chat_member"] = _new_chat_member.getAsJson();

        if ( _invite_link !is null ) data["invite_link"] = _invite_link.getAsJson();

        return data;
    }

    /** Chat the user belongs to */
    private TelegramChat _chat;
    /**
     * Getter for '_chat'
     * Returns: Current value of '_chat'
     */
    @property TelegramChat chat () { return _chat; }
    /**
     * Setter for '_chat'
     * Params: chatNew = New value of '_chat'
     * Returns: New value of '_chat'
     */
    @property TelegramChat chat ( TelegramChat chatNew ) { return _chat = chatNew; }

    /** Performer of the action, which resulted in the change */
    private TelegramUser _from;
    /**
     * Getter for '_from'
     * Returns: Current value of '_from'
     */
    @property TelegramUser from () { return _from; }
    /**
     * Setter for '_from'
     * Params: fromNew = New value of '_from'
     * Returns: New value of '_from'
     */
    @property TelegramUser from ( TelegramUser fromNew ) { return _from = fromNew; }

    /** Date the change was done in Unix time */
    private ulong _date;
    /**
     * Getter for '_date'
     * Returns: Current value of '_date'
     */
    @property ulong date () { return _date; }
    /**
     * Setter for '_date'
     * Params: dateNew = New value of '_date'
     * Returns: New value of '_date'
     */
    @property ulong date ( ulong dateNew ) { return _date = dateNew; }

    /** Previous information about the chat member */
    private TelegramChatMember _old_chat_member;
    /**
     * Getter for '_old_chat_member'
     * Returns: Current value of '_old_chat_member'
     */
    @property TelegramChatMember oldChatMember () { return _old_chat_member; }
    /**
     * Setter for '_old_chat_member'
     * Params: oldChatMemberNew = New value of '_old_chat_member'
     * Returns: New value of '_old_chat_member'
     */
    @property TelegramChatMember oldChatMember ( TelegramChatMember oldChatMemberNew ) { return _old_chat_member = oldChatMemberNew; }

    /** New information about the chat member */
    private TelegramChatMember _new_chat_member;
    /**
     * Getter for '_new_chat_member'
     * Returns: Current value of '_new_chat_member'
     */
    @property TelegramChatMember newChatMember () { return _new_chat_member; }
    /**
     * Setter for '_new_chat_member'
     * Params: newChatMemberNew = New value of '_new_chat_member'
     * Returns: New value of '_new_chat_member'
     */
    @property TelegramChatMember newChatMember ( TelegramChatMember newChatMemberNew ) { return _new_chat_member = newChatMemberNew; }

    /** <em>Optional</em>. Chat invite link, which was used by the user to join the chat; for joining by invite link events only. */
    private TelegramChatInviteLink _invite_link;
    /**
     * Getter for '_invite_link'
     * Returns: Current value of '_invite_link'
     */
    @property TelegramChatInviteLink inviteLink () { return _invite_link; }
    /**
     * Setter for '_invite_link'
     * Params: inviteLinkNew = New value of '_invite_link'
     * Returns: New value of '_invite_link'
     */
    @property TelegramChatInviteLink inviteLink ( TelegramChatInviteLink inviteLinkNew ) { return _invite_link = inviteLinkNew; }
}

