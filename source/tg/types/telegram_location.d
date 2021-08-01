/**
 * Contains TelegramLocation
 */
module tg.types.telegram_location;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a point on the map.
 */
class TelegramLocation : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _longitude = double.nan;
        _latitude = double.nan;
        _horizontal_accuracy = double.nan;
        _live_period = 0;
        _heading = 0;
        _proximity_alert_radius = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "longitude" !in data ) throw new TelegramException("Could not find reqired entry : longitude");
        _longitude = data["longitude"].floating();

        if ( "latitude" !in data ) throw new TelegramException("Could not find reqired entry : latitude");
        _latitude = data["latitude"].floating();

        if ( "horizontal_accuracy" in data )
        _horizontal_accuracy = data["horizontal_accuracy"].floating();

        if ( "live_period" in data )
        _live_period = data["live_period"].integer();

        if ( "heading" in data )
        _heading = data["heading"].integer();

        if ( "proximity_alert_radius" in data )
        _proximity_alert_radius = data["proximity_alert_radius"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["longitude"] = _longitude;

        data["latitude"] = _latitude;

        if ( _horizontal_accuracy != double.nan ) data["horizontal_accuracy"] = _horizontal_accuracy;

        if ( _live_period != 0 ) data["live_period"] = _live_period;

        if ( _heading != 0 ) data["heading"] = _heading;

        if ( _proximity_alert_radius != 0 ) data["proximity_alert_radius"] = _proximity_alert_radius;

        return data;
    }

    /** Longitude as defined by sender */
    private double _longitude;
    /**
     * Getter for '_longitude'
     * Returns: Current value of '_longitude'
     */
    @property double longitude () { return _longitude; }
    /**
     * Setter for '_longitude'
     * Params: longitudeNew = New value of '_longitude'
     * Returns: New value of '_longitude'
     */
    @property double longitude ( double longitudeNew ) { return _longitude = longitudeNew; }

    /** Latitude as defined by sender */
    private double _latitude;
    /**
     * Getter for '_latitude'
     * Returns: Current value of '_latitude'
     */
    @property double latitude () { return _latitude; }
    /**
     * Setter for '_latitude'
     * Params: latitudeNew = New value of '_latitude'
     * Returns: New value of '_latitude'
     */
    @property double latitude ( double latitudeNew ) { return _latitude = latitudeNew; }

    /** <em>Optional</em>. The radius of uncertainty for the location, measured in meters; 0-1500 */
    private double _horizontal_accuracy;
    /**
     * Getter for '_horizontal_accuracy'
     * Returns: Current value of '_horizontal_accuracy'
     */
    @property double horizontalAccuracy () { return _horizontal_accuracy; }
    /**
     * Setter for '_horizontal_accuracy'
     * Params: horizontalAccuracyNew = New value of '_horizontal_accuracy'
     * Returns: New value of '_horizontal_accuracy'
     */
    @property double horizontalAccuracy ( double horizontalAccuracyNew ) { return _horizontal_accuracy = horizontalAccuracyNew; }

    /** <em>Optional</em>. Time relative to the message sending date, during which the location can be updated, in seconds. For active live locations only. */
    private ulong _live_period;
    /**
     * Getter for '_live_period'
     * Returns: Current value of '_live_period'
     */
    @property ulong livePeriod () { return _live_period; }
    /**
     * Setter for '_live_period'
     * Params: livePeriodNew = New value of '_live_period'
     * Returns: New value of '_live_period'
     */
    @property ulong livePeriod ( ulong livePeriodNew ) { return _live_period = livePeriodNew; }

    /** <em>Optional</em>. The direction in which user is moving, in degrees; 1-360. For active live locations only. */
    private ulong _heading;
    /**
     * Getter for '_heading'
     * Returns: Current value of '_heading'
     */
    @property ulong heading () { return _heading; }
    /**
     * Setter for '_heading'
     * Params: headingNew = New value of '_heading'
     * Returns: New value of '_heading'
     */
    @property ulong heading ( ulong headingNew ) { return _heading = headingNew; }

    /** <em>Optional</em>. Maximum distance for proximity alerts about approaching another chat member, in meters. For sent live locations only. */
    private ulong _proximity_alert_radius;
    /**
     * Getter for '_proximity_alert_radius'
     * Returns: Current value of '_proximity_alert_radius'
     */
    @property ulong proximityAlertRadius () { return _proximity_alert_radius; }
    /**
     * Setter for '_proximity_alert_radius'
     * Params: proximityAlertRadiusNew = New value of '_proximity_alert_radius'
     * Returns: New value of '_proximity_alert_radius'
     */
    @property ulong proximityAlertRadius ( ulong proximityAlertRadiusNew ) { return _proximity_alert_radius = proximityAlertRadiusNew; }
}

