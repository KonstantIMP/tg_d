/**
 * Contains TelegramInputMediaVideo
 */
module tg.types.telegram_input_media_video;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * Represents a video to be sent.
 */
class TelegramInputMediaVideo : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _media = "";
        _thumb = "";
        _caption = "";
        _parse_mode = "";
        _caption_entities = null;
        _width = 0;
        _height = 0;
        _duration = 0;
        _supports_streaming = false;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "media" !in data ) throw new TelegramException("Could not find reqired entry : media");
        _media = data["media"].str();

        if ( "thumb" in data )
        _thumb = data["thumb"].str();

        if ( "caption" in data )
        _caption = data["caption"].str();

        if ( "parse_mode" in data )
        _parse_mode = data["parse_mode"].str();

        if ( "caption_entities" in data )
        _caption_entities = toTelegram!TelegramMessageEntity(data["caption_entities"]);

        if ( "width" in data )
        _width = data["width"].integer();

        if ( "height" in data )
        _height = data["height"].integer();

        if ( "duration" in data )
        _duration = data["duration"].integer();

        if ( "supports_streaming" in data )
        _supports_streaming = data["supports_streaming"].boolean();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["media"] = _media;

        if ( _thumb != "" ) data["thumb"] = _thumb;

        if ( _caption != "" ) data["caption"] = _caption;

        if ( _parse_mode != "" ) data["parse_mode"] = _parse_mode;

        if ( _caption_entities !is null ) data["caption_entities"] = _caption_entities.getAsJson();

        if ( _width != 0 ) data["width"] = _width;

        if ( _height != 0 ) data["height"] = _height;

        if ( _duration != 0 ) data["duration"] = _duration;

        data["supports_streaming"] = _supports_streaming;

        return data;
    }

    /** Type of the result, must be <em>video</em> */
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

    /** File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass &#8220;attach://&lt;file_attach_name&gt;&#8221; to upload a new one using multipart/form-data under &lt;file_attach_name&gt; name. More info on Sending Files &#187; */
    private string _media;
    /**
     * Getter for '_media'
     * Returns: Current value of '_media'
     */
    @property string media () { return _media; }
    /**
     * Setter for '_media'
     * Params: mediaNew = New value of '_media'
     * Returns: New value of '_media'
     */
    @property string media ( string mediaNew ) { return _media = mediaNew; }

    /** <em>Optional</em>. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass &#8220;attach://&lt;file_attach_name&gt;&#8221; if the thumbnail was uploaded using multipart/form-data under &lt;file_attach_name&gt;. More info on Sending Files &#187; */
    private string _thumb;
    /**
     * Getter for '_thumb'
     * Returns: Current value of '_thumb'
     */
    @property string thumb () { return _thumb; }
    /**
     * Setter for '_thumb'
     * Params: thumbNew = New value of '_thumb'
     * Returns: New value of '_thumb'
     */
    @property string thumb ( string thumbNew ) { return _thumb = thumbNew; }

    /** <em>Optional</em>. Caption of the video to be sent, 0-1024 characters after entities parsing */
    private string _caption;
    /**
     * Getter for '_caption'
     * Returns: Current value of '_caption'
     */
    @property string caption () { return _caption; }
    /**
     * Setter for '_caption'
     * Params: captionNew = New value of '_caption'
     * Returns: New value of '_caption'
     */
    @property string caption ( string captionNew ) { return _caption = captionNew; }

    /** <em>Optional</em>. Mode for parsing entities in the video caption. See formatting options for more details. */
    private string _parse_mode;
    /**
     * Getter for '_parse_mode'
     * Returns: Current value of '_parse_mode'
     */
    @property string parseMode () { return _parse_mode; }
    /**
     * Setter for '_parse_mode'
     * Params: parseModeNew = New value of '_parse_mode'
     * Returns: New value of '_parse_mode'
     */
    @property string parseMode ( string parseModeNew ) { return _parse_mode = parseModeNew; }

    /** <em>Optional</em>. List of special entities that appear in the caption, which can be specified instead of <em>parse_mode</em> */
    private TelegramMessageEntity[] _caption_entities;
    /**
     * Getter for '_caption_entities'
     * Returns: Current value of '_caption_entities'
     */
    @property TelegramMessageEntity[] captionEntities () { return _caption_entities; }
    /**
     * Setter for '_caption_entities'
     * Params: captionEntitiesNew = New value of '_caption_entities'
     * Returns: New value of '_caption_entities'
     */
    @property TelegramMessageEntity[] captionEntities ( TelegramMessageEntity[] captionEntitiesNew ) { return _caption_entities = captionEntitiesNew; }

    /** <em>Optional</em>. Video width */
    private ulong _width;
    /**
     * Getter for '_width'
     * Returns: Current value of '_width'
     */
    @property ulong width () { return _width; }
    /**
     * Setter for '_width'
     * Params: widthNew = New value of '_width'
     * Returns: New value of '_width'
     */
    @property ulong width ( ulong widthNew ) { return _width = widthNew; }

    /** <em>Optional</em>. Video height */
    private ulong _height;
    /**
     * Getter for '_height'
     * Returns: Current value of '_height'
     */
    @property ulong height () { return _height; }
    /**
     * Setter for '_height'
     * Params: heightNew = New value of '_height'
     * Returns: New value of '_height'
     */
    @property ulong height ( ulong heightNew ) { return _height = heightNew; }

    /** <em>Optional</em>. Video duration */
    private ulong _duration;
    /**
     * Getter for '_duration'
     * Returns: Current value of '_duration'
     */
    @property ulong duration () { return _duration; }
    /**
     * Setter for '_duration'
     * Params: durationNew = New value of '_duration'
     * Returns: New value of '_duration'
     */
    @property ulong duration ( ulong durationNew ) { return _duration = durationNew; }

    /** <em>Optional</em>. Pass <em>True</em>, if the uploaded video is suitable for streaming */
    private bool _supports_streaming;
    /**
     * Getter for '_supports_streaming'
     * Returns: Current value of '_supports_streaming'
     */
    @property bool supportsStreaming () { return _supports_streaming; }
    /**
     * Setter for '_supports_streaming'
     * Params: supportsStreamingNew = New value of '_supports_streaming'
     * Returns: New value of '_supports_streaming'
     */
    @property bool supportsStreaming ( bool supportsStreamingNew ) { return _supports_streaming = supportsStreamingNew; }
}

