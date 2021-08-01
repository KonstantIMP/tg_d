/**
 * Contains TelegramGameHighScore
 */
module tg.game.types.telegram_game_high_score;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents one row of the high scores table for a game.
 */
class TelegramGameHighScore : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _position = 0;
        _user = null;
        _score = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "position" !in data ) throw new TelegramException("Could not find reqired entry : position");
        _position = data["position"].integer();

        if ( "user" !in data ) throw new TelegramException("Could not find reqired entry : user");
        _user = new TelegramUser(data["user"]);

        if ( "score" !in data ) throw new TelegramException("Could not find reqired entry : score");
        _score = data["score"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["position"] = _position;

        data["user"] = _user.getAsJson();

        data["score"] = _score;

        return data;
    }

    /** Position in high score table for the game */
    private ulong _position;
    /**
     * Getter for '_position'
     * Returns: Current value of '_position'
     */
    @property ulong position () { return _position; }
    /**
     * Setter for '_position'
     * Params: positionNew = New value of '_position'
     * Returns: New value of '_position'
     */
    @property ulong position ( ulong positionNew ) { return _position = positionNew; }

    /** User */
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

    /** Score */
    private ulong _score;
    /**
     * Getter for '_score'
     * Returns: Current value of '_score'
     */
    @property ulong score () { return _score; }
    /**
     * Setter for '_score'
     * Params: scoreNew = New value of '_score'
     * Returns: New value of '_score'
     */
    @property ulong score ( ulong scoreNew ) { return _score = scoreNew; }
}

