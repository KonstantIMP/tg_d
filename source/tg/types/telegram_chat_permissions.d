/**
 * Contains TelegramChatPermissions
 */
module tg.types.telegram_chat_permissions;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Describes actions that a non-administrator user is allowed to take in a chat.
 */
class TelegramChatPermissions : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _can_send_messages = false;
        _can_send_media_messages = false;
        _can_send_polls = false;
        _can_send_other_messages = false;
        _can_add_web_page_previews = false;
        _can_change_info = false;
        _can_invite_users = false;
        _can_pin_messages = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "can_send_messages" in data )
        _can_send_messages = data["can_send_messages"].boolean();

        if ( "can_send_media_messages" in data )
        _can_send_media_messages = data["can_send_media_messages"].boolean();

        if ( "can_send_polls" in data )
        _can_send_polls = data["can_send_polls"].boolean();

        if ( "can_send_other_messages" in data )
        _can_send_other_messages = data["can_send_other_messages"].boolean();

        if ( "can_add_web_page_previews" in data )
        _can_add_web_page_previews = data["can_add_web_page_previews"].boolean();

        if ( "can_change_info" in data )
        _can_change_info = data["can_change_info"].boolean();

        if ( "can_invite_users" in data )
        _can_invite_users = data["can_invite_users"].boolean();

        if ( "can_pin_messages" in data )
        _can_pin_messages = data["can_pin_messages"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["can_send_messages"] = _can_send_messages;

        data["can_send_media_messages"] = _can_send_media_messages;

        data["can_send_polls"] = _can_send_polls;

        data["can_send_other_messages"] = _can_send_other_messages;

        data["can_add_web_page_previews"] = _can_add_web_page_previews;

        data["can_change_info"] = _can_change_info;

        data["can_invite_users"] = _can_invite_users;

        data["can_pin_messages"] = _can_pin_messages;

        return data;
    }

    /** <em>Optional</em>. True, if the user is allowed to send text messages, contacts, locations and venues */
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

    /** <em>Optional</em>. True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages */
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

    /** <em>Optional</em>. True, if the user is allowed to send polls, implies can_send_messages */
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

    /** <em>Optional</em>. True, if the user is allowed to send animations, games, stickers and use inline bots, implies can_send_media_messages */
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

    /** <em>Optional</em>. True, if the user is allowed to add web page previews to their messages, implies can_send_media_messages */
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

    /** <em>Optional</em>. True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups */
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

    /** <em>Optional</em>. True, if the user is allowed to invite new users to the chat */
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

    /** <em>Optional</em>. True, if the user is allowed to pin messages. Ignored in public supergroups */
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
}

