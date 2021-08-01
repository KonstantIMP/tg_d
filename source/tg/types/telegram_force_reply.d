/**
 * Contains TelegramForceReply
 */
module tg.types.telegram_force_reply;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot's message and tapped 'Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode.
 */
class TelegramForceReply : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _force_reply = false;
        _input_field_placeholder = "";
        _selective = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "force_reply" !in data ) throw new TelegramException("Could not find reqired entry : force_reply");
        _force_reply = data["force_reply"].boolean();

        if ( "input_field_placeholder" in data )
        _input_field_placeholder = data["input_field_placeholder"].str();

        if ( "selective" in data )
        _selective = data["selective"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["force_reply"] = _force_reply;

        if ( _input_field_placeholder != "" ) data["input_field_placeholder"] = _input_field_placeholder;

        data["selective"] = _selective;

        return data;
    }

    /** Shows reply interface to the user, as if they manually selected the bot's message and tapped 'Reply' */
    private bool _force_reply;
    /**
     * Getter for '_force_reply'
     * Returns: Current value of '_force_reply'
     */
    @property bool forceReply () { return _force_reply; }
    /**
     * Setter for '_force_reply'
     * Params: forceReplyNew = New value of '_force_reply'
     * Returns: New value of '_force_reply'
     */
    @property bool forceReply ( bool forceReplyNew ) { return _force_reply = forceReplyNew; }

    /** <em>Optional</em>. The placeholder to be shown in the input field when the reply is active; 1-64 characters */
    private string _input_field_placeholder;
    /**
     * Getter for '_input_field_placeholder'
     * Returns: Current value of '_input_field_placeholder'
     */
    @property string inputFieldPlaceholder () { return _input_field_placeholder; }
    /**
     * Setter for '_input_field_placeholder'
     * Params: inputFieldPlaceholderNew = New value of '_input_field_placeholder'
     * Returns: New value of '_input_field_placeholder'
     */
    @property string inputFieldPlaceholder ( string inputFieldPlaceholderNew ) { return _input_field_placeholder = inputFieldPlaceholderNew; }

    /** <em>Optional</em>. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the <em>text</em> of the Message object; 2) if the bot's message is a reply (has <em>reply_to_message_id</em>), sender of the original message. */
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

