/**
 * Contains TelegramInlineKeyboardMarkup
 */
module tg.types.telegram_inline_keyboard_markup;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * This object represents an inline keyboard that appears right next to the message it belongs to.
 */
class TelegramInlineKeyboardMarkup : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _inline_keyboard = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "inline_keyboard" !in data ) throw new TelegramException("Could not find reqired entry : inline_keyboard");
        _inline_keyboard = toTelegramMatrix!TelegramInlineKeyboardButton(data["inline_keyboard"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["inline_keyboard"] = _inline_keyboard.getAsJson();

        return data;
    }

    /** Array of button rows, each represented by an Array of InlineKeyboardButton objects */
    private TelegramInlineKeyboardButton[][] _inline_keyboard;
    /**
     * Getter for '_inline_keyboard'
     * Returns: Current value of '_inline_keyboard'
     */
    @property TelegramInlineKeyboardButton[][] inlineKeyboard () { return _inline_keyboard; }
    /**
     * Setter for '_inline_keyboard'
     * Params: inlineKeyboardNew = New value of '_inline_keyboard'
     * Returns: New value of '_inline_keyboard'
     */
    @property TelegramInlineKeyboardButton[][] inlineKeyboard ( TelegramInlineKeyboardButton[][] inlineKeyboardNew ) { return _inline_keyboard = inlineKeyboardNew; }
}

