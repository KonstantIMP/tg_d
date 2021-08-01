/**
 * Contains TelegramPollAnswer
 */
module tg.types.telegram_poll_answer;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents an answer of a user in a non-anonymous poll.
 */
class TelegramPollAnswer : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _poll_id = "";
        _user = null;
        _option_ids = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "poll_id" !in data ) throw new TelegramException("Could not find reqired entry : poll_id");
        _poll_id = data["poll_id"].str();

        if ( "user" !in data ) throw new TelegramException("Could not find reqired entry : user");
        _user = new TelegramUser(data["user"]);

        if ( "option_ids" !in data ) throw new TelegramException("Could not find reqired entry : option_ids");
        _option_ids = data["option_ids"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["poll_id"] = _poll_id;

        data["user"] = _user.getAsJson();

        data["option_ids"] = _option_ids;

        return data;
    }

    /** Unique poll identifier */
    private string _poll_id;
    /**
     * Getter for '_poll_id'
     * Returns: Current value of '_poll_id'
     */
    @property string pollId () { return _poll_id; }
    /**
     * Setter for '_poll_id'
     * Params: pollIdNew = New value of '_poll_id'
     * Returns: New value of '_poll_id'
     */
    @property string pollId ( string pollIdNew ) { return _poll_id = pollIdNew; }

    /** The user, who changed the answer to the poll */
    private TelegramUser _user;
    /**
     * Getter for '_user'
     * Returns: Current value of '_user'
     */
    @property TelegramUser user () { return _user; }
    /**
     * Setter for '_user'
     * Params: userNew = New value of '_user'
     * Returns: New value of '_user'
     */
    @property TelegramUser user ( TelegramUser userNew ) { return _user = userNew; }

    /** 0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote. */
    private ulong _option_ids;
    /**
     * Getter for '_option_ids'
     * Returns: Current value of '_option_ids'
     */
    @property ulong optionIds () { return _option_ids; }
    /**
     * Setter for '_option_ids'
     * Params: optionIdsNew = New value of '_option_ids'
     * Returns: New value of '_option_ids'
     */
    @property ulong optionIds ( ulong optionIdsNew ) { return _option_ids = optionIdsNew; }
}

