/**
 * Contains TelegramPollOption
 */
module tg.types.telegram_poll_option;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object contains information about one answer option in a poll.
 */
class TelegramPollOption : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _text = "";
        _voter_count = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "text" !in data ) throw new TelegramException("Could not find reqired entry : text");
        _text = data["text"].str();

        if ( "voter_count" !in data ) throw new TelegramException("Could not find reqired entry : voter_count");
        _voter_count = data["voter_count"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["text"] = _text;

        data["voter_count"] = _voter_count;

        return data;
    }

    /** Option text, 1-100 characters */
    private string _text;
    /**
     * Getter for '_text'
     * Returns: Current value of '_text'
     */
    @property string text () { return _text; }
    /**
     * Setter for '_text'
     * Params: textNew = New value of '_text'
     * Returns: New value of '_text'
     */
    @property string text ( string textNew ) { return _text = textNew; }

    /** Number of users that voted for this option */
    private ulong _voter_count;
    /**
     * Getter for '_voter_count'
     * Returns: Current value of '_voter_count'
     */
    @property ulong voterCount () { return _voter_count; }
    /**
     * Setter for '_voter_count'
     * Params: voterCountNew = New value of '_voter_count'
     * Returns: New value of '_voter_count'
     */
    @property ulong voterCount ( ulong voterCountNew ) { return _voter_count = voterCountNew; }
}

