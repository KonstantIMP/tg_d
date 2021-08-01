/**
 * Contains TelegramInlineQueryResultLocation
 */
module tg.inline.types.telegram_inline_query_result_location;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use <em>input_message_content</em> to send a message with the specified content instead of the location.
 */
class TelegramInlineQueryResultLocation : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _id = "";
        _latitude = double.nan;
        _longitude = double.nan;
        _title = "";
        _horizontal_accuracy = double.nan;
        _live_period = 0;
        _heading = 0;
        _proximity_alert_radius = 0;
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

        if ( "horizontal_accuracy" in data )
        _horizontal_accuracy = data["horizontal_accuracy"].floating();

        if ( "live_period" in data )
        _live_period = data["live_period"].integer();

        if ( "heading" in data )
        _heading = data["heading"].integer();

        if ( "proximity_alert_radius" in data )
        _proximity_alert_radius = data["proximity_alert_radius"].integer();

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

        if ( _horizontal_accuracy != double.nan ) data["horizontal_accuracy"] = _horizontal_accuracy;

        if ( _live_period != 0 ) data["live_period"] = _live_period;

        if ( _heading != 0 ) data["heading"] = _heading;

        if ( _proximity_alert_radius != 0 ) data["proximity_alert_radius"] = _proximity_alert_radius;

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        if ( _input_message_content !is null ) data["input_message_content"] = _input_message_content.getAsJson();

        if ( _thumb_url != "" ) data["thumb_url"] = _thumb_url;

        if ( _thumb_width != 0 ) data["thumb_width"] = _thumb_width;

        if ( _thumb_height != 0 ) data["thumb_height"] = _thumb_height;

        return data;
    }

    /** Type of the result, must be <em>location</em> */
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

    /** Location latitude in degrees */
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

    /** Location longitude in degrees */
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

    /** Location title */
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

    /** <em>Optional</em>. Content of the message to be sent instead of the location */
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

