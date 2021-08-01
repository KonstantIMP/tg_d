/**
 * Contains TelegramInputLocationMessageContent
 */
module tg.inline.types.telegram_input_location_message_content;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents the content of a location message to be sent as the result of an inline query.
 */
class TelegramInputLocationMessageContent : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _latitude = double.nan;
        _longitude = double.nan;
        _horizontal_accuracy = double.nan;
        _live_period = 0;
        _heading = 0;
        _proximity_alert_radius = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "latitude" !in data ) throw new TelegramException("Could not find reqired entry : latitude");
        _latitude = data["latitude"].floating();

        if ( "longitude" !in data ) throw new TelegramException("Could not find reqired entry : longitude");
        _longitude = data["longitude"].floating();

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

        data["latitude"] = _latitude;

        data["longitude"] = _longitude;

        if ( _horizontal_accuracy != double.nan ) data["horizontal_accuracy"] = _horizontal_accuracy;

        if ( _live_period != 0 ) data["live_period"] = _live_period;

        if ( _heading != 0 ) data["heading"] = _heading;

        if ( _proximity_alert_radius != 0 ) data["proximity_alert_radius"] = _proximity_alert_radius;

        return data;
    }

    /** Latitude of the location in degrees */
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

    /** Longitude of the location in degrees */
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

    /** <em>Optional</em>. Period in seconds for which the location can be updated, should be between 60 and 86400. */
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

    /** <em>Optional</em>. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified. */
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

    /** <em>Optional</em>. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified. */
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

