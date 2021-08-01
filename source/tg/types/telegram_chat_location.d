/**
 * Contains TelegramChatLocation
 */
module tg.types.telegram_chat_location;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a location to which a chat is connected.
 */
class TelegramChatLocation : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _location = null;
        _address = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "location" !in data ) throw new TelegramException("Could not find reqired entry : location");
        _location = new TelegramLocation(data["location"]);

        if ( "address" !in data ) throw new TelegramException("Could not find reqired entry : address");
        _address = data["address"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["location"] = _location.getAsJson();

        data["address"] = _address;

        return data;
    }

    /** The location to which the supergroup is connected. Can't be a live location. */
    private TelegramLocation _location;
    /**
     * Getter for '_location'
     * Returns: Current value of '_location'
     */
    @property TelegramLocation location () { return _location; }
    /**
     * Setter for '_location'
     * Params: locationNew = New value of '_location'
     * Returns: New value of '_location'
     */
    @property TelegramLocation location ( TelegramLocation locationNew ) { return _location = locationNew; }

    /** Location address; 1-64 characters, as defined by the chat owner */
    private string _address;
    /**
     * Getter for '_address'
     * Returns: Current value of '_address'
     */
    @property string address () { return _address; }
    /**
     * Setter for '_address'
     * Params: addressNew = New value of '_address'
     * Returns: New value of '_address'
     */
    @property string address ( string addressNew ) { return _address = addressNew; }
}

