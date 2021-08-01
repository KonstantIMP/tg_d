/**
 * Contains TelegramChatMemberRestricted
 */
module tg.types.telegram_chat_member_restricted;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a chat member that is under certain restrictions in the chat. Supergroups only.
 */
class TelegramChatMemberRestricted : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _status = "";
        _user = null;
        _is_member = false;
        _can_change_info = false;
        _can_invite_users = false;
        _can_pin_messages = false;
        _can_send_messages = false;
        _can_send_media_messages = false;
        _can_send_polls = false;
        _can_send_other_messages = false;
        _can_add_web_page_previews = false;
        _until_date = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "status" !in data ) throw new TelegramException("Could not find reqired entry : status");
        _status = data["status"].str();

        if ( "user" !in data ) throw new TelegramException("Could not find reqired entry : user");
        _user = new TelegramUser(data["user"]);

        if ( "is_member" !in data ) throw new TelegramException("Could not find reqired entry : is_member");
        _is_member = data["is_member"].boolean();

        if ( "can_change_info" !in data ) throw new TelegramException("Could not find reqired entry : can_change_info");
        _can_change_info = data["can_change_info"].boolean();

        if ( "can_invite_users" !in data ) throw new TelegramException("Could not find reqired entry : can_invite_users");
        _can_invite_users = data["can_invite_users"].boolean();

        if ( "can_pin_messages" !in data ) throw new TelegramException("Could not find reqired entry : can_pin_messages");
        _can_pin_messages = data["can_pin_messages"].boolean();

        if ( "can_send_messages" !in data ) throw new TelegramException("Could not find reqired entry : can_send_messages");
        _can_send_messages = data["can_send_messages"].boolean();

        if ( "can_send_media_messages" !in data ) throw new TelegramException("Could not find reqired entry : can_send_media_messages");
        _can_send_media_messages = data["can_send_media_messages"].boolean();

        if ( "can_send_polls" !in data ) throw new TelegramException("Could not find reqired entry : can_send_polls");
        _can_send_polls = data["can_send_polls"].boolean();

        if ( "can_send_other_messages" !in data ) throw new TelegramException("Could not find reqired entry : can_send_other_messages");
        _can_send_other_messages = data["can_send_other_messages"].boolean();

        if ( "can_add_web_page_previews" !in data ) throw new TelegramException("Could not find reqired entry : can_add_web_page_previews");
        _can_add_web_page_previews = data["can_add_web_page_previews"].boolean();

        if ( "until_date" !in data ) throw new TelegramException("Could not find reqired entry : until_date");
        _until_date = data["until_date"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["status"] = _status;

        data["user"] = _user.getAsJson();

        data["is_member"] = _is_member;

        data["can_change_info"] = _can_change_info;

        data["can_invite_users"] = _can_invite_users;

        data["can_pin_messages"] = _can_pin_messages;

        data["can_send_messages"] = _can_send_messages;

        data["can_send_media_messages"] = _can_send_media_messages;

        data["can_send_polls"] = _can_send_polls;

        data["can_send_other_messages"] = _can_send_other_messages;

        data["can_add_web_page_previews"] = _can_add_web_page_previews;

        data["until_date"] = _until_date;

        return data;
    }

    /** The member's status in the chat, always &#8220;restricted&#8221; */
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

    /** True, if the user is a member of the chat at the moment of the request */
    private bool _is_member;
    /**
     * Getter for '_is_member'
     * Returns: Current value of '_is_member'
     */
    @property bool isMember () { return _is_member; }
    /**
     * Setter for '_is_member'
     * Params: isMemberNew = New value of '_is_member'
     * Returns: New value of '_is_member'
     */
    @property bool isMember ( bool isMemberNew ) { return _is_member = isMemberNew; }

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

    /** True, if the user is allowed to pin messages */
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

    /** True, if the user is allowed to send text messages, contacts, locations and venues */
    private bool _can_send_messages;
    /**
     * Getter for '_can_send_messages'
     * Returns: Current value of '_can_send_messages'
     */
    @property bool canSendMessages () { return _can_send_messages; }
    /**
     * Setter for '_can_send_messages'
     * Params: canSendMessagesNew = New value of '_can_send_messages'
     * Returns: New value of '_can_send_messages'
     */
    @property bool canSendMessages ( bool canSendMessagesNew ) { return _can_send_messages = canSendMessagesNew; }

    /** True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes */
    private bool _can_send_media_messages;
    /**
     * Getter for '_can_send_media_messages'
     * Returns: Current value of '_can_send_media_messages'
     */
    @property bool canSendMediaMessages () { return _can_send_media_messages; }
    /**
     * Setter for '_can_send_media_messages'
     * Params: canSendMediaMessagesNew = New value of '_can_send_media_messages'
     * Returns: New value of '_can_send_media_messages'
     */
    @property bool canSendMediaMessages ( bool canSendMediaMessagesNew ) { return _can_send_media_messages = canSendMediaMessagesNew; }

    /** True, if the user is allowed to send polls */
    private bool _can_send_polls;
    /**
     * Getter for '_can_send_polls'
     * Returns: Current value of '_can_send_polls'
     */
    @property bool canSendPolls () { return _can_send_polls; }
    /**
     * Setter for '_can_send_polls'
     * Params: canSendPollsNew = New value of '_can_send_polls'
     * Returns: New value of '_can_send_polls'
     */
    @property bool canSendPolls ( bool canSendPollsNew ) { return _can_send_polls = canSendPollsNew; }

    /** True, if the user is allowed to send animations, games, stickers and use inline bots */
    private bool _can_send_other_messages;
    /**
     * Getter for '_can_send_other_messages'
     * Returns: Current value of '_can_send_other_messages'
     */
    @property bool canSendOtherMessages () { return _can_send_other_messages; }
    /**
     * Setter for '_can_send_other_messages'
     * Params: canSendOtherMessagesNew = New value of '_can_send_other_messages'
     * Returns: New value of '_can_send_other_messages'
     */
    @property bool canSendOtherMessages ( bool canSendOtherMessagesNew ) { return _can_send_other_messages = canSendOtherMessagesNew; }

    /** True, if the user is allowed to add web page previews to their messages */
    private bool _can_add_web_page_previews;
    /**
     * Getter for '_can_add_web_page_previews'
     * Returns: Current value of '_can_add_web_page_previews'
     */
    @property bool canAddWebPagePreviews () { return _can_add_web_page_previews; }
    /**
     * Setter for '_can_add_web_page_previews'
     * Params: canAddWebPagePreviewsNew = New value of '_can_add_web_page_previews'
     * Returns: New value of '_can_add_web_page_previews'
     */
    @property bool canAddWebPagePreviews ( bool canAddWebPagePreviewsNew ) { return _can_add_web_page_previews = canAddWebPagePreviewsNew; }

    /** Date when restrictions will be lifted for this user; unix time. If 0, then the user is restricted forever */
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

