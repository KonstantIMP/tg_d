/**
 * Contains TelegramMessageEntity
 */
module tg.types.telegram_message_entity;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
 */
class TelegramMessageEntity : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _type = "";
        _offset = 0;
        _length = 0;
        _url = "";
        _user = null;
        _language = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "type" !in data ) throw new TelegramException("Could not find reqired entry : type");
        _type = data["type"].str();

        if ( "offset" !in data ) throw new TelegramException("Could not find reqired entry : offset");
        _offset = data["offset"].integer();

        if ( "length" !in data ) throw new TelegramException("Could not find reqired entry : length");
        _length = data["length"].integer();

        if ( "url" in data )
        _url = data["url"].str();

        if ( "user" in data )
        _user = new TelegramUser(data["user"]);

        if ( "language" in data )
        _language = data["language"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["type"] = _type;

        data["offset"] = _offset;

        data["length"] = _length;

        if ( _url != "" ) data["url"] = _url;

        if ( _user !is null ) data["user"] = _user.getAsJson();

        if ( _language != "" ) data["language"] = _language;

        return data;
    }

    /** Type of the entity. Can be &#8220;mention&#8221; (<code>@username</code>), &#8220;hashtag&#8221; (<code>#hashtag</code>), &#8220;cashtag&#8221; (<code>$USD</code>), &#8220;bot_command&#8221; (<code>/start@jobs_bot</code>), &#8220;url&#8221; (<code>https://telegram.org</code>), &#8220;email&#8221; (<code>do-not-reply@telegram.org</code>), &#8220;phone_number&#8221; (<code>+1-212-555-0123</code>), &#8220;bold&#8221; (<strong>bold text</strong>), &#8220;italic&#8221; (<em>italic text</em>), &#8220;underline&#8221; (underlined text), &#8220;strikethrough&#8221; (strikethrough text), &#8220;code&#8221; (monowidth string), &#8220;pre&#8221; (monowidth block), &#8220;text_link&#8221; (for clickable text URLs), &#8220;text_mention&#8221; (for users without usernames) */
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

    /** Offset in UTF-16 code units to the start of the entity */
    private ulong _offset;
    /**
     * Getter for '_offset'
     * Returns: Current value of '_offset'
     */
    @property ulong offset () { return _offset; }
    /**
     * Setter for '_offset'
     * Params: offsetNew = New value of '_offset'
     * Returns: New value of '_offset'
     */
    @property ulong offset ( ulong offsetNew ) { return _offset = offsetNew; }

    /** Length of the entity in UTF-16 code units */
    private ulong _length;
    /**
     * Getter for '_length'
     * Returns: Current value of '_length'
     */
    @property ulong length () { return _length; }
    /**
     * Setter for '_length'
     * Params: lengthNew = New value of '_length'
     * Returns: New value of '_length'
     */
    @property ulong length ( ulong lengthNew ) { return _length = lengthNew; }

    /** <em>Optional</em>. For &#8220;text_link&#8221; only, url that will be opened after user taps on the text */
    private string _url;
    /**
     * Getter for '_url'
     * Returns: Current value of '_url'
     */
    @property string url () { return _url; }
    /**
     * Setter for '_url'
     * Params: urlNew = New value of '_url'
     * Returns: New value of '_url'
     */
    @property string url ( string urlNew ) { return _url = urlNew; }

    /** <em>Optional</em>. For &#8220;text_mention&#8221; only, the mentioned user */
    private TelegramUser _user;
    /**
     * Getter for '_user'
     * Returns: Current value of '_user'
     */
    @property TelegramUser user () { return _user; }
    /**
     * Setter for '_user'
     * Params: userNew = New value of '_user'
     * Returns: New value of '_user'
     */
    @property TelegramUser user ( TelegramUser userNew ) { return _user = userNew; }

    /** <em>Optional</em>. For &#8220;pre&#8221; only, the programming language of the entity text */
    private string _language;
    /**
     * Getter for '_language'
     * Returns: Current value of '_language'
     */
    @property string language () { return _language; }
    /**
     * Setter for '_language'
     * Params: languageNew = New value of '_language'
     * Returns: New value of '_language'
     */
    @property string language ( string languageNew ) { return _language = languageNew; }
}

