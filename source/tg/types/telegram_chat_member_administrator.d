/**
 * Contains TelegramChatMemberAdministrator
 */
module tg.types.telegram_chat_member_administrator;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a chat member that has some additional privileges.
 */
class TelegramChatMemberAdministrator : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _status = "";
        _user = null;
        _can_be_edited = false;
        _is_anonymous = false;
        _can_manage_chat = false;
        _can_delete_messages = false;
        _can_manage_voice_chats = false;
        _can_restrict_members = false;
        _can_promote_members = false;
        _can_change_info = false;
        _can_invite_users = false;
        _can_post_messages = false;
        _can_edit_messages = false;
        _can_pin_messages = false;
        _custom_title = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "status" !in data ) throw new TelegramException("Could not find reqired entry : status");
        _status = data["status"].str();

        if ( "user" !in data ) throw new TelegramException("Could not find reqired entry : user");
        _user = new TelegramUser(data["user"]);

        if ( "can_be_edited" !in data ) throw new TelegramException("Could not find reqired entry : can_be_edited");
        _can_be_edited = data["can_be_edited"].boolean();

        if ( "is_anonymous" !in data ) throw new TelegramException("Could not find reqired entry : is_anonymous");
        _is_anonymous = data["is_anonymous"].boolean();

        if ( "can_manage_chat" !in data ) throw new TelegramException("Could not find reqired entry : can_manage_chat");
        _can_manage_chat = data["can_manage_chat"].boolean();

        if ( "can_delete_messages" !in data ) throw new TelegramException("Could not find reqired entry : can_delete_messages");
        _can_delete_messages = data["can_delete_messages"].boolean();

        if ( "can_manage_voice_chats" !in data ) throw new TelegramException("Could not find reqired entry : can_manage_voice_chats");
        _can_manage_voice_chats = data["can_manage_voice_chats"].boolean();

        if ( "can_restrict_members" !in data ) throw new TelegramException("Could not find reqired entry : can_restrict_members");
        _can_restrict_members = data["can_restrict_members"].boolean();

        if ( "can_promote_members" !in data ) throw new TelegramException("Could not find reqired entry : can_promote_members");
        _can_promote_members = data["can_promote_members"].boolean();

        if ( "can_change_info" !in data ) throw new TelegramException("Could not find reqired entry : can_change_info");
        _can_change_info = data["can_change_info"].boolean();

        if ( "can_invite_users" !in data ) throw new TelegramException("Could not find reqired entry : can_invite_users");
        _can_invite_users = data["can_invite_users"].boolean();

        if ( "can_post_messages" in data )
        _can_post_messages = data["can_post_messages"].boolean();

        if ( "can_edit_messages" in data )
        _can_edit_messages = data["can_edit_messages"].boolean();

        if ( "can_pin_messages" in data )
        _can_pin_messages = data["can_pin_messages"].boolean();

        if ( "custom_title" in data )
        _custom_title = data["custom_title"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["status"] = _status;

        data["user"] = _user.getAsJson();

        data["can_be_edited"] = _can_be_edited;

        data["is_anonymous"] = _is_anonymous;

        data["can_manage_chat"] = _can_manage_chat;

        data["can_delete_messages"] = _can_delete_messages;

        data["can_manage_voice_chats"] = _can_manage_voice_chats;

        data["can_restrict_members"] = _can_restrict_members;

        data["can_promote_members"] = _can_promote_members;

        data["can_change_info"] = _can_change_info;

        data["can_invite_users"] = _can_invite_users;

        data["can_post_messages"] = _can_post_messages;

        data["can_edit_messages"] = _can_edit_messages;

        data["can_pin_messages"] = _can_pin_messages;

        if ( _custom_title != "" ) data["custom_title"] = _custom_title;

        return data;
    }

    /** The member's status in the chat, always &#8220;administrator&#8221; */
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

    /** True, if the bot is allowed to edit administrator privileges of that user */
    private bool _can_be_edited;
    /**
     * Getter for '_can_be_edited'
     * Returns: Current value of '_can_be_edited'
     */
    @property bool canBeEdited () { return _can_be_edited; }
    /**
     * Setter for '_can_be_edited'
     * Params: canBeEditedNew = New value of '_can_be_edited'
     * Returns: New value of '_can_be_edited'
     */
    @property bool canBeEdited ( bool canBeEditedNew ) { return _can_be_edited = canBeEditedNew; }

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

    /** True, if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other administrator privilege */
    private bool _can_manage_chat;
    /**
     * Getter for '_can_manage_chat'
     * Returns: Current value of '_can_manage_chat'
     */
    @property bool canManageChat () { return _can_manage_chat; }
    /**
     * Setter for '_can_manage_chat'
     * Params: canManageChatNew = New value of '_can_manage_chat'
     * Returns: New value of '_can_manage_chat'
     */
    @property bool canManageChat ( bool canManageChatNew ) { return _can_manage_chat = canManageChatNew; }

    /** True, if the administrator can delete messages of other users */
    private bool _can_delete_messages;
    /**
     * Getter for '_can_delete_messages'
     * Returns: Current value of '_can_delete_messages'
     */
    @property bool canDeleteMessages () { return _can_delete_messages; }
    /**
     * Setter for '_can_delete_messages'
     * Params: canDeleteMessagesNew = New value of '_can_delete_messages'
     * Returns: New value of '_can_delete_messages'
     */
    @property bool canDeleteMessages ( bool canDeleteMessagesNew ) { return _can_delete_messages = canDeleteMessagesNew; }

    /** True, if the administrator can manage voice chats */
    private bool _can_manage_voice_chats;
    /**
     * Getter for '_can_manage_voice_chats'
     * Returns: Current value of '_can_manage_voice_chats'
     */
    @property bool canManageVoiceChats () { return _can_manage_voice_chats; }
    /**
     * Setter for '_can_manage_voice_chats'
     * Params: canManageVoiceChatsNew = New value of '_can_manage_voice_chats'
     * Returns: New value of '_can_manage_voice_chats'
     */
    @property bool canManageVoiceChats ( bool canManageVoiceChatsNew ) { return _can_manage_voice_chats = canManageVoiceChatsNew; }

    /** True, if the administrator can restrict, ban or unban chat members */
    private bool _can_restrict_members;
    /**
     * Getter for '_can_restrict_members'
     * Returns: Current value of '_can_restrict_members'
     */
    @property bool canRestrictMembers () { return _can_restrict_members; }
    /**
     * Setter for '_can_restrict_members'
     * Params: canRestrictMembersNew = New value of '_can_restrict_members'
     * Returns: New value of '_can_restrict_members'
     */
    @property bool canRestrictMembers ( bool canRestrictMembersNew ) { return _can_restrict_members = canRestrictMembersNew; }

    /** True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user) */
    private bool _can_promote_members;
    /**
     * Getter for '_can_promote_members'
     * Returns: Current value of '_can_promote_members'
     */
    @property bool canPromoteMembers () { return _can_promote_members; }
    /**
     * Setter for '_can_promote_members'
     * Params: canPromoteMembersNew = New value of '_can_promote_members'
     * Returns: New value of '_can_promote_members'
     */
    @property bool canPromoteMembers ( bool canPromoteMembersNew ) { return _can_promote_members = canPromoteMembersNew; }

    /** True, if the user is allowed to change the chat title, photo and other settings */
    private bool _can_change_info;
    /**
     * Getter for '_can_change_info'
     * Returns: Current value of '_can_change_info'
     */
    @property bool canChangeInfo () { return _can_change_info; }
    /**
     * Setter for '_can_change_info'
     * Params: canChangeInfoNew = New value of '_can_change_info'
     * Returns: New value of '_can_change_info'
     */
    @property bool canChangeInfo ( bool canChangeInfoNew ) { return _can_change_info = canChangeInfoNew; }

    /** True, if the user is allowed to invite new users to the chat */
    private bool _can_invite_users;
    /**
     * Getter for '_can_invite_users'
     * Returns: Current value of '_can_invite_users'
     */
    @property bool canInviteUsers () { return _can_invite_users; }
    /**
     * Setter for '_can_invite_users'
     * Params: canInviteUsersNew = New value of '_can_invite_users'
     * Returns: New value of '_can_invite_users'
     */
    @property bool canInviteUsers ( bool canInviteUsersNew ) { return _can_invite_users = canInviteUsersNew; }

    /** <em>Optional</em>. True, if the administrator can post in the channel; channels only */
    private bool _can_post_messages;
    /**
     * Getter for '_can_post_messages'
     * Returns: Current value of '_can_post_messages'
     */
    @property bool canPostMessages () { return _can_post_messages; }
    /**
     * Setter for '_can_post_messages'
     * Params: canPostMessagesNew = New value of '_can_post_messages'
     * Returns: New value of '_can_post_messages'
     */
    @property bool canPostMessages ( bool canPostMessagesNew ) { return _can_post_messages = canPostMessagesNew; }

    /** <em>Optional</em>. True, if the administrator can edit messages of other users and can pin messages; channels only */
    private bool _can_edit_messages;
    /**
     * Getter for '_can_edit_messages'
     * Returns: Current value of '_can_edit_messages'
     */
    @property bool canEditMessages () { return _can_edit_messages; }
    /**
     * Setter for '_can_edit_messages'
     * Params: canEditMessagesNew = New value of '_can_edit_messages'
     * Returns: New value of '_can_edit_messages'
     */
    @property bool canEditMessages ( bool canEditMessagesNew ) { return _can_edit_messages = canEditMessagesNew; }

    /** <em>Optional</em>. True, if the user is allowed to pin messages; groups and supergroups only */
    private bool _can_pin_messages;
    /**
     * Getter for '_can_pin_messages'
     * Returns: Current value of '_can_pin_messages'
     */
    @property bool canPinMessages () { return _can_pin_messages; }
    /**
     * Setter for '_can_pin_messages'
     * Params: canPinMessagesNew = New value of '_can_pin_messages'
     * Returns: New value of '_can_pin_messages'
     */
    @property bool canPinMessages ( bool canPinMessagesNew ) { return _can_pin_messages = canPinMessagesNew; }

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

