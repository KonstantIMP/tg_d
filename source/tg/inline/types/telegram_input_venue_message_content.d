/**
 * Contains TelegramInputVenueMessageContent
 */
module tg.inline.types.telegram_input_venue_message_content;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents the content of a venue message to be sent as the result of an inline query.
 */
class TelegramInputVenueMessageContent : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _latitude = double.nan;
        _longitude = double.nan;
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
        if ( "latitude" !in data ) throw new TelegramException("Could not find reqired entry : latitude");
        _latitude = data["latitude"].floating();

        if ( "longitude" !in data ) throw new TelegramException("Could not find reqired entry : longitude");
        _longitude = data["longitude"].floating();

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

        data["latitude"] = _latitude;

        data["longitude"] = _longitude;

        data["title"] = _title;

        data["address"] = _address;

        if ( _foursquare_id != "" ) data["foursquare_id"] = _foursquare_id;

        if ( _foursquare_type != "" ) data["foursquare_type"] = _foursquare_type;

        if ( _google_place_id != "" ) data["google_place_id"] = _google_place_id;

        if ( _google_place_type != "" ) data["google_place_type"] = _google_place_type;

        return data;
    }

    /** Latitude of the venue in degrees */
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

    /** Longitude of the venue in degrees */
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

    /** <em>Optional</em>. Foursquare identifier of the venue, if known */
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

    /** <em>Optional</em>. Foursquare type of the venue, if known. (For example, &#8220;arts_entertainment/default&#8221;, &#8220;arts_entertainment/aquarium&#8221; or &#8220;food/icecream&#8221;.) */
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

