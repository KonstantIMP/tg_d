/**
 * Contains TelegramReplyKeyboardRemove
 */
module tg.types.telegram_reply_keyboard_remove;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup).
 */
class TelegramReplyKeyboardRemove : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _remove_keyboard = false;
        _selective = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "remove_keyboard" !in data ) throw new TelegramException("Could not find reqired entry : remove_keyboard");
        _remove_keyboard = data["remove_keyboard"].boolean();

        if ( "selective" in data )
        _selective = data["selective"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["remove_keyboard"] = _remove_keyboard;

        data["selective"] = _selective;

        return data;
    }

    /** Requests clients to remove the custom keyboard (user will not be able to summon this keyboard; if you want to hide the keyboard from sight but keep it accessible, use <em>one_time_keyboard</em> in ReplyKeyboardMarkup) */
    private bool _remove_keyboard;
    /**
     * Getter for '_remove_keyboard'
     * Returns: Current value of '_remove_keyboard'
     */
    @property bool removeKeyboard () { return _remove_keyboard; }
    /**
     * Setter for '_remove_keyboard'
     * Params: removeKeyboardNew = New value of '_remove_keyboard'
     * Returns: New value of '_remove_keyboard'
     */
    @property bool removeKeyboard ( bool removeKeyboardNew ) { return _remove_keyboard = removeKeyboardNew; }

    /** <em>Optional</em>. Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are @mentioned in the <em>text</em> of the Message object; 2) if the bot's message is a reply (has <em>reply_to_message_id</em>), sender of the original message.<br /><br /><em>Example:</em> A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven't voted yet. */
    private bool _selective;
    /**
     * Getter for '_selective'
     * Returns: Current value of '_selective'
     */
    @property bool selective () { return _selective; }
    /**
     * Setter for '_selective'
     * Params: selectiveNew = New value of '_selective'
     * Returns: New value of '_selective'
     */
    @property bool selective ( bool selectiveNew ) { return _selective = selectiveNew; }
}

