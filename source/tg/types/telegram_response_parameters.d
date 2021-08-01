/**
 * Contains TelegramResponseParameters
 */
module tg.types.telegram_response_parameters;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Contains information about why a request was unsuccessful.
 */
class TelegramResponseParameters : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _migrate_to_chat_id = 0;
        _retry_after = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "migrate_to_chat_id" in data )
        _migrate_to_chat_id = data["migrate_to_chat_id"].integer();

        if ( "retry_after" in data )
        _retry_after = data["retry_after"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        if ( _migrate_to_chat_id != 0 ) data["migrate_to_chat_id"] = _migrate_to_chat_id;

        if ( _retry_after != 0 ) data["retry_after"] = _retry_after;

        return data;
    }

    /** <em>Optional</em>. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier. */
    private ulong _migrate_to_chat_id;
    /**
     * Getter for '_migrate_to_chat_id'
     * Returns: Current value of '_migrate_to_chat_id'
     */
    @property ulong migrateToChatId () { return _migrate_to_chat_id; }
    /**
     * Setter for '_migrate_to_chat_id'
     * Params: migrateToChatIdNew = New value of '_migrate_to_chat_id'
     * Returns: New value of '_migrate_to_chat_id'
     */
    @property ulong migrateToChatId ( ulong migrateToChatIdNew ) { return _migrate_to_chat_id = migrateToChatIdNew; }

    /** <em>Optional</em>. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated */
    private ulong _retry_after;
    /**
     * Getter for '_retry_after'
     * Returns: Current value of '_retry_after'
     */
    @property ulong retryAfter () { return _retry_after; }
    /**
     * Setter for '_retry_after'
     * Params: retryAfterNew = New value of '_retry_after'
     * Returns: New value of '_retry_after'
     */
    @property ulong retryAfter ( ulong retryAfterNew ) { return _retry_after = retryAfterNew; }
}

