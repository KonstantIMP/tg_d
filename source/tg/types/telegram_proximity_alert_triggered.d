/**
 * Contains TelegramProximityAlertTriggered
 */
module tg.types.telegram_proximity_alert_triggered;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents the content of a service message, sent whenever a user in the chat triggers a proximity alert set by another user.
 */
class TelegramProximityAlertTriggered : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _traveler = null;
        _watcher = null;
        _distance = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "traveler" !in data ) throw new TelegramException("Could not find reqired entry : traveler");
        _traveler = new TelegramUser(data["traveler"]);

        if ( "watcher" !in data ) throw new TelegramException("Could not find reqired entry : watcher");
        _watcher = new TelegramUser(data["watcher"]);

        if ( "distance" !in data ) throw new TelegramException("Could not find reqired entry : distance");
        _distance = data["distance"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["traveler"] = _traveler.getAsJson();

        data["watcher"] = _watcher.getAsJson();

        data["distance"] = _distance;

        return data;
    }

    /** User that triggered the alert */
    private TelegramUser _traveler;
    /**
     * Getter for '_traveler'
     * Returns: Current value of '_traveler'
     */
    @property TelegramUser traveler () { return _traveler; }
    /**
     * Setter for '_traveler'
     * Params: travelerNew = New value of '_traveler'
     * Returns: New value of '_traveler'
     */
    @property TelegramUser traveler ( TelegramUser travelerNew ) { return _traveler = travelerNew; }

    /** User that set the alert */
    private TelegramUser _watcher;
    /**
     * Getter for '_watcher'
     * Returns: Current value of '_watcher'
     */
    @property TelegramUser watcher () { return _watcher; }
    /**
     * Setter for '_watcher'
     * Params: watcherNew = New value of '_watcher'
     * Returns: New value of '_watcher'
     */
    @property TelegramUser watcher ( TelegramUser watcherNew ) { return _watcher = watcherNew; }

    /** The distance between the users */
    private ulong _distance;
    /**
     * Getter for '_distance'
     * Returns: Current value of '_distance'
     */
    @property ulong distance () { return _distance; }
    /**
     * Setter for '_distance'
     * Params: distanceNew = New value of '_distance'
     * Returns: New value of '_distance'
     */
    @property ulong distance ( ulong distanceNew ) { return _distance = distanceNew; }
}

