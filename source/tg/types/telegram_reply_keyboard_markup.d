/**
 * Contains TelegramReplyKeyboardMarkup
 */
module tg.types.telegram_reply_keyboard_markup;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * This object represents a custom keyboard with reply options (see Introduction to bots for details and examples).
 */
class TelegramReplyKeyboardMarkup : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _keyboard = null;
        _resize_keyboard = false;
        _one_time_keyboard = false;
        _input_field_placeholder = "";
        _selective = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "keyboard" !in data ) throw new TelegramException("Could not find reqired entry : keyboard");
        _keyboard = toTelegramMatrix!TelegramKeyboardButton(data["keyboard"]);

        if ( "resize_keyboard" in data )
        _resize_keyboard = data["resize_keyboard"].boolean();

        if ( "one_time_keyboard" in data )
        _one_time_keyboard = data["one_time_keyboard"].boolean();

        if ( "input_field_placeholder" in data )
        _input_field_placeholder = data["input_field_placeholder"].str();

        if ( "selective" in data )
        _selective = data["selective"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["keyboard"] = _keyboard.getAsJson();

        data["resize_keyboard"] = _resize_keyboard;

        data["one_time_keyboard"] = _one_time_keyboard;

        if ( _input_field_placeholder != "" ) data["input_field_placeholder"] = _input_field_placeholder;

        data["selective"] = _selective;

        return data;
    }

    /** Array of button rows, each represented by an Array of KeyboardButton objects */
    private TelegramKeyboardButton[][] _keyboard;
    /**
     * Getter for '_keyboard'
     * Returns: Current value of '_keyboard'
     */
    @property TelegramKeyboardButton[][] keyboard () { return _keyboard; }
    /**
     * Setter for '_keyboard'
     * Params: keyboardNew = New value of '_keyboard'
     * Returns: New value of '_keyboard'
     */
    @property TelegramKeyboardButton[][] keyboard ( TelegramKeyboardButton[][] keyboardNew ) { return _keyboard = keyboardNew; }

    /** <em>Optional</em>. Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to <em>false</em>, in which case the custom keyboard is always of the same height as the app's standard keyboard. */
    private bool _resize_keyboard;
    /**
     * Getter for '_resize_keyboard'
     * Returns: Current value of '_resize_keyboard'
     */
    @property bool resizeKeyboard () { return _resize_keyboard; }
    /**
     * Setter for '_resize_keyboard'
     * Params: resizeKeyboardNew = New value of '_resize_keyboard'
     * Returns: New value of '_resize_keyboard'
     */
    @property bool resizeKeyboard ( bool resizeKeyboardNew ) { return _resize_keyboard = resizeKeyboardNew; }

    /** <em>Optional</em>. Requests clients to hide the keyboard as soon as it's been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat &#8211; the user can press a special button in the input field to see the custom keyboard again. Defaults to <em>false</em>. */
    private bool _one_time_keyboard;
    /**
     * Getter for '_one_time_keyboard'
     * Returns: Current value of '_one_time_keyboard'
     */
    @property bool oneTimeKeyboard () { return _one_time_keyboard; }
    /**
     * Setter for '_one_time_keyboard'
     * Params: oneTimeKeyboardNew = New value of '_one_time_keyboard'
     * Returns: New value of '_one_time_keyboard'
     */
    @property bool oneTimeKeyboard ( bool oneTimeKeyboardNew ) { return _one_time_keyboard = oneTimeKeyboardNew; }

    /** <em>Optional</em>. The placeholder to be shown in the input field when the keyboard is active; 1-64 characters */
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

    /** <em>Optional</em>. Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the <em>text</em> of the Message object; 2) if the bot's message is a reply (has <em>reply_to_message_id</em>), sender of the original message.<br /><br /><em>Example:</em> A user requests to change the bot's language, bot replies to the request with a keyboard to select the new language. Other users in the group don't see the keyboard. */
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

