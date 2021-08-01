/**
 * Contains TelegramWebhookInfo
 */
module tg.update.types.telegram_webhook_info;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * Contains information about the current status of a webhook.
 */
class TelegramWebhookInfo : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _url = "";
        _has_custom_certificate = false;
        _pending_update_count = 0;
        _ip_address = "";
        _last_error_date = 0;
        _last_error_message = "";
        _max_connections = 0;
        _allowed_updates = "";
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "url" !in data ) throw new TelegramException("Could not find reqired entry : url");
        _url = data["url"].str();

        if ( "has_custom_certificate" !in data ) throw new TelegramException("Could not find reqired entry : has_custom_certificate");
        _has_custom_certificate = data["has_custom_certificate"].boolean();

        if ( "pending_update_count" !in data ) throw new TelegramException("Could not find reqired entry : pending_update_count");
        _pending_update_count = data["pending_update_count"].integer();

        if ( "ip_address" in data )
        _ip_address = data["ip_address"].str();

        if ( "last_error_date" in data )
        _last_error_date = data["last_error_date"].integer();

        if ( "last_error_message" in data )
        _last_error_message = data["last_error_message"].str();

        if ( "max_connections" in data )
        _max_connections = data["max_connections"].integer();

        if ( "allowed_updates" in data )
        _allowed_updates = data["allowed_updates"].str();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["url"] = _url;

        data["has_custom_certificate"] = _has_custom_certificate;

        data["pending_update_count"] = _pending_update_count;

        if ( _ip_address != "" ) data["ip_address"] = _ip_address;

        if ( _last_error_date != 0 ) data["last_error_date"] = _last_error_date;

        if ( _last_error_message != "" ) data["last_error_message"] = _last_error_message;

        if ( _max_connections != 0 ) data["max_connections"] = _max_connections;

        if ( _allowed_updates != "" ) data["allowed_updates"] = _allowed_updates;

        return data;
    }

    /** Webhook URL, may be empty if webhook is not set up */
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

    /** True, if a custom certificate was provided for webhook certificate checks */
    private bool _has_custom_certificate;
    /**
     * Getter for '_has_custom_certificate'
     * Returns: Current value of '_has_custom_certificate'
     */
    @property bool hasCustomCertificate () { return _has_custom_certificate; }
    /**
     * Setter for '_has_custom_certificate'
     * Params: hasCustomCertificateNew = New value of '_has_custom_certificate'
     * Returns: New value of '_has_custom_certificate'
     */
    @property bool hasCustomCertificate ( bool hasCustomCertificateNew ) { return _has_custom_certificate = hasCustomCertificateNew; }

    /** Number of updates awaiting delivery */
    private ulong _pending_update_count;
    /**
     * Getter for '_pending_update_count'
     * Returns: Current value of '_pending_update_count'
     */
    @property ulong pendingUpdateCount () { return _pending_update_count; }
    /**
     * Setter for '_pending_update_count'
     * Params: pendingUpdateCountNew = New value of '_pending_update_count'
     * Returns: New value of '_pending_update_count'
     */
    @property ulong pendingUpdateCount ( ulong pendingUpdateCountNew ) { return _pending_update_count = pendingUpdateCountNew; }

    /** <em>Optional</em>. Currently used webhook IP address */
    private string _ip_address;
    /**
     * Getter for '_ip_address'
     * Returns: Current value of '_ip_address'
     */
    @property string ipAddress () { return _ip_address; }
    /**
     * Setter for '_ip_address'
     * Params: ipAddressNew = New value of '_ip_address'
     * Returns: New value of '_ip_address'
     */
    @property string ipAddress ( string ipAddressNew ) { return _ip_address = ipAddressNew; }

    /** <em>Optional</em>. Unix time for the most recent error that happened when trying to deliver an update via webhook */
    private ulong _last_error_date;
    /**
     * Getter for '_last_error_date'
     * Returns: Current value of '_last_error_date'
     */
    @property ulong lastErrorDate () { return _last_error_date; }
    /**
     * Setter for '_last_error_date'
     * Params: lastErrorDateNew = New value of '_last_error_date'
     * Returns: New value of '_last_error_date'
     */
    @property ulong lastErrorDate ( ulong lastErrorDateNew ) { return _last_error_date = lastErrorDateNew; }

    /** <em>Optional</em>. Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook */
    private string _last_error_message;
    /**
     * Getter for '_last_error_message'
     * Returns: Current value of '_last_error_message'
     */
    @property string lastErrorMessage () { return _last_error_message; }
    /**
     * Setter for '_last_error_message'
     * Params: lastErrorMessageNew = New value of '_last_error_message'
     * Returns: New value of '_last_error_message'
     */
    @property string lastErrorMessage ( string lastErrorMessageNew ) { return _last_error_message = lastErrorMessageNew; }

    /** <em>Optional</em>. Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery */
    private ulong _max_connections;
    /**
     * Getter for '_max_connections'
     * Returns: Current value of '_max_connections'
     */
    @property ulong maxConnections () { return _max_connections; }
    /**
     * Setter for '_max_connections'
     * Params: maxConnectionsNew = New value of '_max_connections'
     * Returns: New value of '_max_connections'
     */
    @property ulong maxConnections ( ulong maxConnectionsNew ) { return _max_connections = maxConnectionsNew; }

    /** <em>Optional</em>. A list of update types the bot is subscribed to. Defaults to all update types except <em>chat_member</em> */
    private string _allowed_updates;
    /**
     * Getter for '_allowed_updates'
     * Returns: Current value of '_allowed_updates'
     */
    @property string allowedUpdates () { return _allowed_updates; }
    /**
     * Setter for '_allowed_updates'
     * Params: allowedUpdatesNew = New value of '_allowed_updates'
     * Returns: New value of '_allowed_updates'
     */
    @property string allowedUpdates ( string allowedUpdatesNew ) { return _allowed_updates = allowedUpdatesNew; }
}

