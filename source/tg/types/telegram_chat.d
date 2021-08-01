/**
 * Contains TelegramChat
 */
module tg.types.telegram_chat;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a chat.
 */
class TelegramChat : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _id = 0;
        _type = "";
        _title = "";
        _username = "";
        _first_name = "";
        _last_name = "";
        _photo = null;
        _bio = "";
        _description = "";
        _invite_link = "";
        _pinned_message = null;
        _permissions = null;
        _slow_mode_delay = 0;
        _message_auto_delete_time = 0;
        _sticker_set_name = "";
        _can_set_sticker_set = false;
        _linked_chat_id = 0;
        _location = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].integer();

        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "title" in data )
        _title = data["title"].str();

        if ( "username" in data )
        _username = data["username"].str();

        if ( "first_name" in data )
        _first_name = data["first_name"].str();

        if ( "last_name" in data )
        _last_name = data["last_name"].str();

        if ( "photo" in data )
        _photo = new TelegramChatPhoto(data["photo"]);

        if ( "bio" in data )
        _bio = data["bio"].str();

        if ( "description" in data )
        _description = data["description"].str();

        if ( "invite_link" in data )
        _invite_link = data["invite_link"].str();

        if ( "pinned_message" in data )
        _pinned_message = new TelegramMessage(data["pinned_message"]);

        if ( "permissions" in data )
        _permissions = new TelegramChatPermissions(data["permissions"]);

        if ( "slow_mode_delay" in data )
        _slow_mode_delay = data["slow_mode_delay"].integer();

        if ( "message_auto_delete_time" in data )
        _message_auto_delete_time = data["message_auto_delete_time"].integer();

        if ( "sticker_set_name" in data )
        _sticker_set_name = data["sticker_set_name"].str();

        if ( "can_set_sticker_set" in data )
        _can_set_sticker_set = data["can_set_sticker_set"].boolean();

        if ( "linked_chat_id" in data )
        _linked_chat_id = data["linked_chat_id"].integer();

        if ( "location" in data )
        _location = new TelegramChatLocation(data["location"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["id"] = _id;

        data["type"] = _type;

        if ( _title != "" ) data["title"] = _title;

        if ( _username != "" ) data["username"] = _username;

        if ( _first_name != "" ) data["first_name"] = _first_name;

        if ( _last_name != "" ) data["last_name"] = _last_name;

        if ( _photo !is null ) data["photo"] = _photo.getAsJson();

        if ( _bio != "" ) data["bio"] = _bio;

        if ( _description != "" ) data["description"] = _description;

        if ( _invite_link != "" ) data["invite_link"] = _invite_link;

        if ( _pinned_message !is null ) data["pinned_message"] = _pinned_message.getAsJson();

        if ( _permissions !is null ) data["permissions"] = _permissions.getAsJson();

        if ( _slow_mode_delay != 0 ) data["slow_mode_delay"] = _slow_mode_delay;

        if ( _message_auto_delete_time != 0 ) data["message_auto_delete_time"] = _message_auto_delete_time;

        if ( _sticker_set_name != "" ) data["sticker_set_name"] = _sticker_set_name;

        data["can_set_sticker_set"] = _can_set_sticker_set;

        if ( _linked_chat_id != 0 ) data["linked_chat_id"] = _linked_chat_id;

        if ( _location !is null ) data["location"] = _location.getAsJson();

        return data;
    }

    /** Unique identifier for this chat. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier. */
    private ulong _id;
    /**
     * Getter for '_id'
     * Returns: Current value of '_id'
     */
    @property ulong id () { return _id; }
    /**
     * Setter for '_id'
     * Params: idNew = New value of '_id'
     * Returns: New value of '_id'
     */
    @property ulong id ( ulong idNew ) { return _id = idNew; }

    /** Type of chat, can be either &#8220;private&#8221;, &#8220;group&#8221;, &#8220;supergroup&#8221; or &#8220;channel&#8221; */
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

    /** <em>Optional</em>. Title, for supergroups, channels and group chats */
    private string _title;
    /**
     * Getter for '_title'
     * Returns: Current value of '_title'
     */
    @property string title () { return _title; }
    /**
     * Setter for '_title'
     * Params: titleNew = New value of '_title'
     * Returns: New value of '_title'
     */
    @property string title ( string titleNew ) { return _title = titleNew; }

    /** <em>Optional</em>. Username, for private chats, supergroups and channels if available */
    private string _username;
    /**
     * Getter for '_username'
     * Returns: Current value of '_username'
     */
    @property string username () { return _username; }
    /**
     * Setter for '_username'
     * Params: usernameNew = New value of '_username'
     * Returns: New value of '_username'
     */
    @property string username ( string usernameNew ) { return _username = usernameNew; }

    /** <em>Optional</em>. First name of the other party in a private chat */
    private string _first_name;
    /**
     * Getter for '_first_name'
     * Returns: Current value of '_first_name'
     */
    @property string firstName () { return _first_name; }
    /**
     * Setter for '_first_name'
     * Params: firstNameNew = New value of '_first_name'
     * Returns: New value of '_first_name'
     */
    @property string firstName ( string firstNameNew ) { return _first_name = firstNameNew; }

    /** <em>Optional</em>. Last name of the other party in a private chat */
    private string _last_name;
    /**
     * Getter for '_last_name'
     * Returns: Current value of '_last_name'
     */
    @property string lastName () { return _last_name; }
    /**
     * Setter for '_last_name'
     * Params: lastNameNew = New value of '_last_name'
     * Returns: New value of '_last_name'
     */
    @property string lastName ( string lastNameNew ) { return _last_name = lastNameNew; }

    /** <em>Optional</em>. Chat photo. Returned only in getChat. */
    private TelegramChatPhoto _photo;
    /**
     * Getter for '_photo'
     * Returns: Current value of '_photo'
     */
    @property TelegramChatPhoto photo () { return _photo; }
    /**
     * Setter for '_photo'
     * Params: photoNew = New value of '_photo'
     * Returns: New value of '_photo'
     */
    @property TelegramChatPhoto photo ( TelegramChatPhoto photoNew ) { return _photo = photoNew; }

    /** <em>Optional</em>. Bio of the other party in a private chat. Returned only in getChat. */
    private string _bio;
    /**
     * Getter for '_bio'
     * Returns: Current value of '_bio'
     */
    @property string bio () { return _bio; }
    /**
     * Setter for '_bio'
     * Params: bioNew = New value of '_bio'
     * Returns: New value of '_bio'
     */
    @property string bio ( string bioNew ) { return _bio = bioNew; }

    /** <em>Optional</em>. Description, for groups, supergroups and channel chats. Returned only in getChat. */
    private string _description;
    /**
     * Getter for '_description'
     * Returns: Current value of '_description'
     */
    @property string description () { return _description; }
    /**
     * Setter for '_description'
     * Params: descriptionNew = New value of '_description'
     * Returns: New value of '_description'
     */
    @property string description ( string descriptionNew ) { return _description = descriptionNew; }

    /** <em>Optional</em>. Primary invite link, for groups, supergroups and channel chats. Returned only in getChat. */
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

    /** <em>Optional</em>. The most recent pinned message (by sending date). Returned only in getChat. */
    private TelegramMessage _pinned_message;
    /**
     * Getter for '_pinned_message'
     * Returns: Current value of '_pinned_message'
     */
    @property TelegramMessage pinnedMessage () { return _pinned_message; }
    /**
     * Setter for '_pinned_message'
     * Params: pinnedMessageNew = New value of '_pinned_message'
     * Returns: New value of '_pinned_message'
     */
    @property TelegramMessage pinnedMessage ( TelegramMessage pinnedMessageNew ) { return _pinned_message = pinnedMessageNew; }

    /** <em>Optional</em>. Default chat member permissions, for groups and supergroups. Returned only in getChat. */
    private TelegramChatPermissions _permissions;
    /**
     * Getter for '_permissions'
     * Returns: Current value of '_permissions'
     */
    @property TelegramChatPermissions permissions () { return _permissions; }
    /**
     * Setter for '_permissions'
     * Params: permissionsNew = New value of '_permissions'
     * Returns: New value of '_permissions'
     */
    @property TelegramChatPermissions permissions ( TelegramChatPermissions permissionsNew ) { return _permissions = permissionsNew; }

    /** <em>Optional</em>. For supergroups, the minimum allowed delay between consecutive messages sent by each unpriviledged user. Returned only in getChat. */
    private ulong _slow_mode_delay;
    /**
     * Getter for '_slow_mode_delay'
     * Returns: Current value of '_slow_mode_delay'
     */
    @property ulong slowModeDelay () { return _slow_mode_delay; }
    /**
     * Setter for '_slow_mode_delay'
     * Params: slowModeDelayNew = New value of '_slow_mode_delay'
     * Returns: New value of '_slow_mode_delay'
     */
    @property ulong slowModeDelay ( ulong slowModeDelayNew ) { return _slow_mode_delay = slowModeDelayNew; }

    /** <em>Optional</em>. The time after which all messages sent to the chat will be automatically deleted; in seconds. Returned only in getChat. */
    private ulong _message_auto_delete_time;
    /**
     * Getter for '_message_auto_delete_time'
     * Returns: Current value of '_message_auto_delete_time'
     */
    @property ulong messageAutoDeleteTime () { return _message_auto_delete_time; }
    /**
     * Setter for '_message_auto_delete_time'
     * Params: messageAutoDeleteTimeNew = New value of '_message_auto_delete_time'
     * Returns: New value of '_message_auto_delete_time'
     */
    @property ulong messageAutoDeleteTime ( ulong messageAutoDeleteTimeNew ) { return _message_auto_delete_time = messageAutoDeleteTimeNew; }

    /** <em>Optional</em>. For supergroups, name of group sticker set. Returned only in getChat. */
    private string _sticker_set_name;
    /**
     * Getter for '_sticker_set_name'
     * Returns: Current value of '_sticker_set_name'
     */
    @property string stickerSetName () { return _sticker_set_name; }
    /**
     * Setter for '_sticker_set_name'
     * Params: stickerSetNameNew = New value of '_sticker_set_name'
     * Returns: New value of '_sticker_set_name'
     */
    @property string stickerSetName ( string stickerSetNameNew ) { return _sticker_set_name = stickerSetNameNew; }

    /** <em>Optional</em>. True, if the bot can change the group sticker set. Returned only in getChat. */
    private bool _can_set_sticker_set;
    /**
     * Getter for '_can_set_sticker_set'
     * Returns: Current value of '_can_set_sticker_set'
     */
    @property bool canSetStickerSet () { return _can_set_sticker_set; }
    /**
     * Setter for '_can_set_sticker_set'
     * Params: canSetStickerSetNew = New value of '_can_set_sticker_set'
     * Returns: New value of '_can_set_sticker_set'
     */
    @property bool canSetStickerSet ( bool canSetStickerSetNew ) { return _can_set_sticker_set = canSetStickerSetNew; }

    /** <em>Optional</em>. Unique identifier for the linked chat, i.e. the discussion group identifier for a channel and vice versa; for supergroups and channel chats. This identifier may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier. Returned only in getChat. */
    private ulong _linked_chat_id;
    /**
     * Getter for '_linked_chat_id'
     * Returns: Current value of '_linked_chat_id'
     */
    @property ulong linkedChatId () { return _linked_chat_id; }
    /**
     * Setter for '_linked_chat_id'
     * Params: linkedChatIdNew = New value of '_linked_chat_id'
     * Returns: New value of '_linked_chat_id'
     */
    @property ulong linkedChatId ( ulong linkedChatIdNew ) { return _linked_chat_id = linkedChatIdNew; }

    /** <em>Optional</em>. For supergroups, the location to which the supergroup is connected. Returned only in getChat. */
    private TelegramChatLocation _location;
    /**
     * Getter for '_location'
     * Returns: Current value of '_location'
     */
    @property TelegramChatLocation location () { return _location; }
    /**
     * Setter for '_location'
     * Params: locationNew = New value of '_location'
     * Returns: New value of '_location'
     */
    @property TelegramChatLocation location ( TelegramChatLocation locationNew ) { return _location = locationNew; }
}

