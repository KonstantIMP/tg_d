/**
 * Contains TelegramUser
 */
module tg.types.telegram_user;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a Telegram user or bot.
 */
class TelegramUser : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _id = 0;
        _is_bot = false;
        _first_name = "";
        _last_name = "";
        _username = "";
        _language_code = "";
        _can_join_groups = false;
        _can_read_all_group_messages = false;
        _supports_inline_queries = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].integer();

        if ( "is_bot" !in data ) throw new TelegramException("Could not find reqired entry : is_bot");
        _is_bot = data["is_bot"].boolean();

        if ( "first_name" !in data ) throw new TelegramException("Could not find reqired entry : first_name");
        _first_name = data["first_name"].str();

        if ( "last_name" in data )
        _last_name = data["last_name"].str();

        if ( "username" in data )
        _username = data["username"].str();

        if ( "language_code" in data )
        _language_code = data["language_code"].str();

        if ( "can_join_groups" in data )
        _can_join_groups = data["can_join_groups"].boolean();

        if ( "can_read_all_group_messages" in data )
        _can_read_all_group_messages = data["can_read_all_group_messages"].boolean();

        if ( "supports_inline_queries" in data )
        _supports_inline_queries = data["supports_inline_queries"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["id"] = _id;

        data["is_bot"] = _is_bot;

        data["first_name"] = _first_name;

        if ( _last_name != "" ) data["last_name"] = _last_name;

        if ( _username != "" ) data["username"] = _username;

        if ( _language_code != "" ) data["language_code"] = _language_code;

        data["can_join_groups"] = _can_join_groups;

        data["can_read_all_group_messages"] = _can_read_all_group_messages;

        data["supports_inline_queries"] = _supports_inline_queries;

        return data;
    }

    /** Unique identifier for this user or bot. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a 64-bit integer or double-precision float type are safe for storing this identifier. */
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

    /** True, if this user is a bot */
    private bool _is_bot;
    /**
     * Getter for '_is_bot'
     * Returns: Current value of '_is_bot'
     */
    @property bool isBot () { return _is_bot; }
    /**
     * Setter for '_is_bot'
     * Params: isBotNew = New value of '_is_bot'
     * Returns: New value of '_is_bot'
     */
    @property bool isBot ( bool isBotNew ) { return _is_bot = isBotNew; }

    /** User's or bot's first name */
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

    /** <em>Optional</em>. User's or bot's last name */
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

    /** <em>Optional</em>. User's or bot's username */
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

    /** <em>Optional</em>. IETF language tag of the user's language */
    private string _language_code;
    /**
     * Getter for '_language_code'
     * Returns: Current value of '_language_code'
     */
    @property string languageCode () { return _language_code; }
    /**
     * Setter for '_language_code'
     * Params: languageCodeNew = New value of '_language_code'
     * Returns: New value of '_language_code'
     */
    @property string languageCode ( string languageCodeNew ) { return _language_code = languageCodeNew; }

    /** <em>Optional</em>. True, if the bot can be invited to groups. Returned only in getMe. */
    private bool _can_join_groups;
    /**
     * Getter for '_can_join_groups'
     * Returns: Current value of '_can_join_groups'
     */
    @property bool canJoinGroups () { return _can_join_groups; }
    /**
     * Setter for '_can_join_groups'
     * Params: canJoinGroupsNew = New value of '_can_join_groups'
     * Returns: New value of '_can_join_groups'
     */
    @property bool canJoinGroups ( bool canJoinGroupsNew ) { return _can_join_groups = canJoinGroupsNew; }

    /** <em>Optional</em>. True, if privacy mode is disabled for the bot. Returned only in getMe. */
    private bool _can_read_all_group_messages;
    /**
     * Getter for '_can_read_all_group_messages'
     * Returns: Current value of '_can_read_all_group_messages'
     */
    @property bool canReadAllGroupMessages () { return _can_read_all_group_messages; }
    /**
     * Setter for '_can_read_all_group_messages'
     * Params: canReadAllGroupMessagesNew = New value of '_can_read_all_group_messages'
     * Returns: New value of '_can_read_all_group_messages'
     */
    @property bool canReadAllGroupMessages ( bool canReadAllGroupMessagesNew ) { return _can_read_all_group_messages = canReadAllGroupMessagesNew; }

    /** <em>Optional</em>. True, if the bot supports inline queries. Returned only in getMe. */
    private bool _supports_inline_queries;
    /**
     * Getter for '_supports_inline_queries'
     * Returns: Current value of '_supports_inline_queries'
     */
    @property bool supportsInlineQueries () { return _supports_inline_queries; }
    /**
     * Setter for '_supports_inline_queries'
     * Params: supportsInlineQueriesNew = New value of '_supports_inline_queries'
     * Returns: New value of '_supports_inline_queries'
     */
    @property bool supportsInlineQueries ( bool supportsInlineQueriesNew ) { return _supports_inline_queries = supportsInlineQueriesNew; }
}

