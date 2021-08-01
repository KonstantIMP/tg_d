/**
 * Contains TelegramBotCommand
 */
module tg.types.telegram_bot_command;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a bot command.
 */
class TelegramBotCommand : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _command = "";
        _description = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "command" !in data ) throw new TelegramException("Could not find reqired entry : command");
        _command = data["command"].str();

        if ( "description" !in data ) throw new TelegramException("Could not find reqired entry : description");
        _description = data["description"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["command"] = _command;

        data["description"] = _description;

        return data;
    }

    /** Text of the command, 1-32 characters. Can contain only lowercase English letters, digits and underscores. */
    private string _command;
    /**
     * Getter for '_command'
     * Returns: Current value of '_command'
     */
    @property string command () { return _command; }
    /**
     * Setter for '_command'
     * Params: commandNew = New value of '_command'
     * Returns: New value of '_command'
     */
    @property string command ( string commandNew ) { return _command = commandNew; }

    /** Description of the command, 3-256 characters. */
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
}

