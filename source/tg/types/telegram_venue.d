/**
 * Contains TelegramVenue
 */
module tg.types.telegram_venue;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents a venue.
 */
class TelegramVenue : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _location = null;
        _title = "";
        _address = "";
        _foursquare_id = "";
        _foursquare_type = "";
        _google_place_id = "";
        _google_place_type = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "location" !in data ) throw new TelegramException("Could not find reqired entry : location");
        _location = new TelegramLocation(data["location"]);

        if ( "title" !in data ) throw new TelegramException("Could not find reqired entry : title");
        _title = data["title"].str();

        if ( "address" !in data ) throw new TelegramException("Could not find reqired entry : address");
        _address = data["address"].str();

        if ( "foursquare_id" in data )
        _foursquare_id = data["foursquare_id"].str();

        if ( "foursquare_type" in data )
        _foursquare_type = data["foursquare_type"].str();

        if ( "google_place_id" in data )
        _google_place_id = data["google_place_id"].str();

        if ( "google_place_type" in data )
        _google_place_type = data["google_place_type"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["location"] = _location.getAsJson();

        data["title"] = _title;

        data["address"] = _address;

        if ( _foursquare_id != "" ) data["foursquare_id"] = _foursquare_id;

        if ( _foursquare_type != "" ) data["foursquare_type"] = _foursquare_type;

        if ( _google_place_id != "" ) data["google_place_id"] = _google_place_id;

        if ( _google_place_type != "" ) data["google_place_type"] = _google_place_type;

        return data;
    }

    /** Venue location. Can't be a live location */
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

    /** Name of the venue */
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

    /** Address of the venue */
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

    /** <em>Optional</em>. Foursquare identifier of the venue */
    private string _foursquare_id;
    /**
     * Getter for '_foursquare_id'
     * Returns: Current value of '_foursquare_id'
     */
    @property string foursquareId () { return _foursquare_id; }
    /**
     * Setter for '_foursquare_id'
     * Params: foursquareIdNew = New value of '_foursquare_id'
     * Returns: New value of '_foursquare_id'
     */
    @property string foursquareId ( string foursquareIdNew ) { return _foursquare_id = foursquareIdNew; }

    /** <em>Optional</em>. Foursquare type of the venue. (For example, &#8220;arts_entertainment/default&#8221;, &#8220;arts_entertainment/aquarium&#8221; or &#8220;food/icecream&#8221;.) */
    private string _foursquare_type;
    /**
     * Getter for '_foursquare_type'
     * Returns: Current value of '_foursquare_type'
     */
    @property string foursquareType () { return _foursquare_type; }
    /**
     * Setter for '_foursquare_type'
     * Params: foursquareTypeNew = New value of '_foursquare_type'
     * Returns: New value of '_foursquare_type'
     */
    @property string foursquareType ( string foursquareTypeNew ) { return _foursquare_type = foursquareTypeNew; }

    /** <em>Optional</em>. Google Places identifier of the venue */
    private string _google_place_id;
    /**
     * Getter for '_google_place_id'
     * Returns: Current value of '_google_place_id'
     */
    @property string googlePlaceId () { return _google_place_id; }
    /**
     * Setter for '_google_place_id'
     * Params: googlePlaceIdNew = New value of '_google_place_id'
     * Returns: New value of '_google_place_id'
     */
    @property string googlePlaceId ( string googlePlaceIdNew ) { return _google_place_id = googlePlaceIdNew; }

    /** <em>Optional</em>. Google Places type of the venue. (See supported types.) */
    private string _google_place_type;
    /**
     * Getter for '_google_place_type'
     * Returns: Current value of '_google_place_type'
     */
    @property string googlePlaceType () { return _google_place_type; }
    /**
     * Setter for '_google_place_type'
     * Params: googlePlaceTypeNew = New value of '_google_place_type'
     * Returns: New value of '_google_place_type'
     */
    @property string googlePlaceType ( string googlePlaceTypeNew ) { return _google_place_type = googlePlaceTypeNew; }
}

