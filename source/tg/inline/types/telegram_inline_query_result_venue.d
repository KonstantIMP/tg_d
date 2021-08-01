/**
 * Contains TelegramInlineQueryResultVenue
 */
module tg.inline.types.telegram_inline_query_result_venue;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use <em>input_message_content</em> to send a message with the specified content instead of the venue.
 */
class TelegramInlineQueryResultVenue : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _latitude = double.nan;
        _longitude = double.nan;
        _title = "";
        _address = "";
        _foursquare_id = "";
        _foursquare_type = "";
        _google_place_id = "";
        _google_place_type = "";
        _reply_markup = null;
        _input_message_content = null;
        _thumb_url = "";
        _thumb_width = 0;
        _thumb_height = 0;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "id" !in data ) throw new TelegramException("Could not find reqired entry : id");
        _id = data["id"].str();

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

        if ( "reply_markup" in data )
        _reply_markup = new TelegramInlineKeyboardMarkup(data["reply_markup"]);

        if ( "input_message_content" in data )
        _input_message_content = new TelegramInputMessageContent(data["input_message_content"]);

        if ( "thumb_url" in data )
        _thumb_url = data["thumb_url"].str();

        if ( "thumb_width" in data )
        _thumb_width = data["thumb_width"].integer();

        if ( "thumb_height" in data )
        _thumb_height = data["thumb_height"].integer();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["id"] = _id;

        data["latitude"] = _latitude;

        data["longitude"] = _longitude;

        data["title"] = _title;

        data["address"] = _address;

        if ( _foursquare_id != "" ) data["foursquare_id"] = _foursquare_id;

        if ( _foursquare_type != "" ) data["foursquare_type"] = _foursquare_type;

        if ( _google_place_id != "" ) data["google_place_id"] = _google_place_id;

        if ( _google_place_type != "" ) data["google_place_type"] = _google_place_type;

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        if ( _input_message_content !is null ) data["input_message_content"] = _input_message_content.getAsJson();

        if ( _thumb_url != "" ) data["thumb_url"] = _thumb_url;

        if ( _thumb_width != 0 ) data["thumb_width"] = _thumb_width;

        if ( _thumb_height != 0 ) data["thumb_height"] = _thumb_height;

        return data;
    }

    /** Type of the result, must be <em>venue</em> */
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

    /** Unique identifier for this result, 1-64 Bytes */
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

    /** Latitude of the venue location in degrees */
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

    /** Longitude of the venue location in degrees */
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

    /** Title of the venue */
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

    /** <em>Optional</em>. Foursquare identifier of the venue if known */
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

    /** <em>Optional</em>. Content of the message to be sent instead of the venue */
    private TelegramInputMessageContent _input_message_content;
    /**
     * Getter for '_input_message_content'
     * Returns: Current value of '_input_message_content'
     */
    @property TelegramInputMessageContent inputMessageContent () { return _input_message_content; }
    /**
     * Setter for '_input_message_content'
     * Params: inputMessageContentNew = New value of '_input_message_content'
     * Returns: New value of '_input_message_content'
     */
    @property TelegramInputMessageContent inputMessageContent ( TelegramInputMessageContent inputMessageContentNew ) { return _input_message_content = inputMessageContentNew; }

    /** <em>Optional</em>. Url of the thumbnail for the result */
    private string _thumb_url;
    /**
     * Getter for '_thumb_url'
     * Returns: Current value of '_thumb_url'
     */
    @property string thumbUrl () { return _thumb_url; }
    /**
     * Setter for '_thumb_url'
     * Params: thumbUrlNew = New value of '_thumb_url'
     * Returns: New value of '_thumb_url'
     */
    @property string thumbUrl ( string thumbUrlNew ) { return _thumb_url = thumbUrlNew; }

    /** <em>Optional</em>. Thumbnail width */
    private ulong _thumb_width;
    /**
     * Getter for '_thumb_width'
     * Returns: Current value of '_thumb_width'
     */
    @property ulong thumbWidth () { return _thumb_width; }
    /**
     * Setter for '_thumb_width'
     * Params: thumbWidthNew = New value of '_thumb_width'
     * Returns: New value of '_thumb_width'
     */
    @property ulong thumbWidth ( ulong thumbWidthNew ) { return _thumb_width = thumbWidthNew; }

    /** <em>Optional</em>. Thumbnail height */
    private ulong _thumb_height;
    /**
     * Getter for '_thumb_height'
     * Returns: Current value of '_thumb_height'
     */
    @property ulong thumbHeight () { return _thumb_height; }
    /**
     * Setter for '_thumb_height'
     * Params: thumbHeightNew = New value of '_thumb_height'
     * Returns: New value of '_thumb_height'
     */
    @property ulong thumbHeight ( ulong thumbHeightNew ) { return _thumb_height = thumbHeightNew; }
}

