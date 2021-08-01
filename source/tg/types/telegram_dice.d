/**
 * Contains TelegramDice
 */
module tg.types.telegram_dice;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents an animated emoji that displays a random value.
 */
class TelegramDice : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _emoji = "";
        _value = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "emoji" !in data ) throw new TelegramException("Could not find reqired entry : emoji");
        _emoji = data["emoji"].str();

        if ( "value" !in data ) throw new TelegramException("Could not find reqired entry : value");
        _value = data["value"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["emoji"] = _emoji;

        data["value"] = _value;

        return data;
    }

    /** Emoji on which the dice throw animation is based */
    private string _emoji;
    /**
     * Getter for '_emoji'
     * Returns: Current value of '_emoji'
     */
    @property string emoji () { return _emoji; }
    /**
     * Setter for '_emoji'
     * Params: emojiNew = New value of '_emoji'
     * Returns: New value of '_emoji'
     */
    @property string emoji ( string emojiNew ) { return _emoji = emojiNew; }

    /** Value of the dice, 1-6 for &#8220;<img alt="&#127922;" class="emoji" height="20" src="//telegram.org/img/emoji/40/F09F8EB2.png" width="20" />&#8221;, &#8220;<img alt="&#127919;" class="emoji" height="20" src="//telegram.org/img/emoji/40/F09F8EAF.png" width="20" />&#8221; and &#8220;<img alt="&#127923;" class="emoji" height="20" src="//telegram.org/img/emoji/40/F09F8EB3.png" width="20" />&#8221; base emoji, 1-5 for &#8220;<img alt="&#127936;" class="emoji" height="20" src="//telegram.org/img/emoji/40/F09F8F80.png" width="20" />&#8221; and &#8220;<img alt="&#9917;" class="emoji" height="20" src="//telegram.org/img/emoji/40/E29ABD.png" width="20" />&#8221; base emoji, 1-64 for &#8220;<img alt="&#127920;" class="emoji" height="20" src="//telegram.org/img/emoji/40/F09F8EB0.png" width="20" />&#8221; base emoji */
    private ulong _value;
    /**
     * Getter for '_value'
     * Returns: Current value of '_value'
     */
    @property ulong value () { return _value; }
    /**
     * Setter for '_value'
     * Params: valueNew = New value of '_value'
     * Returns: New value of '_value'
     */
    @property ulong value ( ulong valueNew ) { return _value = valueNew; }
}

