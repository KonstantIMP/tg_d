/**
 * Contains TelegramInlineQueryResultGame
 */
module tg.inline.types.telegram_inline_query_result_game;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a Game.
 */
class TelegramInlineQueryResultGame : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _game_short_name = "";
        _reply_markup = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

        if ( "game_short_name" !in data ) throw new TelegramException("Could not find reqired entry : game_short_name");
        _game_short_name = data["game_short_name"].str();

        if ( "reply_markup" in data )
        _reply_markup = new TelegramInlineKeyboardMarkup(data["reply_markup"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["id"] = _id;

        data["game_short_name"] = _game_short_name;

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        return data;
    }

    /** Type of the result, must be <em>game</em> */
    private string _type;
    /**
     * Getter for '_type'
     * Returns: Current value of '_type'
     */
    @property string type () { return _type; }
    /**
     * Setter for '_type'
     * Params: typeNew = New value of '_type'
     * Returns: New value of '_type'
     */
    @property string type ( string typeNew ) { return _type = typeNew; }

    /** Unique identifier for this result, 1-64 bytes */
    private string _id;
    /**
     * Getter for '_id'
     * Returns: Current value of '_id'
     */
    @property string id () { return _id; }
    /**
     * Setter for '_id'
     * Params: idNew = New value of '_id'
     * Returns: New value of '_id'
     */
    @property string id ( string idNew ) { return _id = idNew; }

    /** Short name of the game */
    private string _game_short_name;
    /**
     * Getter for '_game_short_name'
     * Returns: Current value of '_game_short_name'
     */
    @property string gameShortName () { return _game_short_name; }
    /**
     * Setter for '_game_short_name'
     * Params: gameShortNameNew = New value of '_game_short_name'
     * Returns: New value of '_game_short_name'
     */
    @property string gameShortName ( string gameShortNameNew ) { return _game_short_name = gameShortNameNew; }

    /** <em>Optional</em>. Inline keyboard attached to the message */
    private TelegramInlineKeyboardMarkup _reply_markup;
    /**
     * Getter for '_reply_markup'
     * Returns: Current value of '_reply_markup'
     */
    @property TelegramInlineKeyboardMarkup replyMarkup () { return _reply_markup; }
    /**
     * Setter for '_reply_markup'
     * Params: replyMarkupNew = New value of '_reply_markup'
     * Returns: New value of '_reply_markup'
     */
    @property TelegramInlineKeyboardMarkup replyMarkup ( TelegramInlineKeyboardMarkup replyMarkupNew ) { return _reply_markup = replyMarkupNew; }
}

