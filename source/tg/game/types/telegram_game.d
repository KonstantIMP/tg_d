/**
 * Contains TelegramGame
 */
module tg.game.types.telegram_game;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.
 */
class TelegramGame : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _title = "";
        _description = "";
        _photo = null;
        _text = "";
        _text_entities = null;
        _animation = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "title" !in data ) throw new TelegramException("Could not find reqired entry : title");
        _title = data["title"].str();

        if ( "description" !in data ) throw new TelegramException("Could not find reqired entry : description");
        _description = data["description"].str();

        if ( "photo" !in data ) throw new TelegramException("Could not find reqired entry : photo");
        _photo = toTelegram!TelegramPhotoSize(data["photo"]);

        if ( "text" in data )
        _text = data["text"].str();

        if ( "text_entities" in data )
        _text_entities = toTelegram!TelegramMessageEntity(data["text_entities"]);

        if ( "animation" in data )
        _animation = new TelegramAnimation(data["animation"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["title"] = _title;

        data["description"] = _description;

        data["photo"] = _photo.getAsJson();

        if ( _text != "" ) data["text"] = _text;

        if ( _text_entities !is null ) data["text_entities"] = _text_entities.getAsJson();

        if ( _animation !is null ) data["animation"] = _animation.getAsJson();

        return data;
    }

    /** Title of the game */
    private string _title;
    /**
     * Getter for '_title'
     * Returns: Current value of '_title'
     */
    @property string title () { return _title; }
    /**
     * Setter for '_title'
     * Params: titleNew = New value of '_title'
     * Returns: New value of '_title'
     */
    @property string title ( string titleNew ) { return _title = titleNew; }

    /** Description of the game */
    private string _description;
    /**
     * Getter for '_description'
     * Returns: Current value of '_description'
     */
    @property string description () { return _description; }
    /**
     * Setter for '_description'
     * Params: descriptionNew = New value of '_description'
     * Returns: New value of '_description'
     */
    @property string description ( string descriptionNew ) { return _description = descriptionNew; }

    /** Photo that will be displayed in the game message in chats. */
    private TelegramPhotoSize[] _photo;
    /**
     * Getter for '_photo'
     * Returns: Current value of '_photo'
     */
    @property TelegramPhotoSize[] photo () { return _photo; }
    /**
     * Setter for '_photo'
     * Params: photoNew = New value of '_photo'
     * Returns: New value of '_photo'
     */
    @property TelegramPhotoSize[] photo ( TelegramPhotoSize[] photoNew ) { return _photo = photoNew; }

    /** <em>Optional</em>. Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters. */
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

    /** <em>Optional</em>. Special entities that appear in <em>text</em>, such as usernames, URLs, bot commands, etc. */
    private TelegramMessageEntity[] _text_entities;
    /**
     * Getter for '_text_entities'
     * Returns: Current value of '_text_entities'
     */
    @property TelegramMessageEntity[] textEntities () { return _text_entities; }
    /**
     * Setter for '_text_entities'
     * Params: textEntitiesNew = New value of '_text_entities'
     * Returns: New value of '_text_entities'
     */
    @property TelegramMessageEntity[] textEntities ( TelegramMessageEntity[] textEntitiesNew ) { return _text_entities = textEntitiesNew; }

    /** <em>Optional</em>. Animation that will be displayed in the game message in chats. Upload via BotFather */
    private TelegramAnimation _animation;
    /**
     * Getter for '_animation'
     * Returns: Current value of '_animation'
     */
    @property TelegramAnimation animation () { return _animation; }
    /**
     * Setter for '_animation'
     * Params: animationNew = New value of '_animation'
     * Returns: New value of '_animation'
     */
    @property TelegramAnimation animation ( TelegramAnimation animationNew ) { return _animation = animationNew; }
}

