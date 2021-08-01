/** 
 * Update and webhook bot`s method
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: 1 Aug 2021
 */
module tg.update.api;

/** Import tg core */
import tg.core.type, tg.core.exception, tg.type;
/** Import JSON lib */
import std.json;

/** 
 * Update and webhook method for import to the TelegramVot
 */
mixin template UpdateBotApi () {
    /** 
     * Use this method to receive incoming updates using long polling
     * Params:
     *   offset = Identifier of the first update to be returned
     *   limit = Limits the number of updates to be retrieved
     *   timeout = Timeout in seconds for long polling
     *   allowed = A JSON-serialized list of the update types you want your bot to receive
     * Returns: An Array of Update objects
     */
    public TelegramUpdate [] getUpdates   ( ulong offset = 0,
                                            ulong limit = 100,
                                            ulong timeout = 0,
                                            string [] allowed = null) {
        JSONValue request = parseJSON("");

        if (limit > 100) throw new TelegramException ("Incorrect \'limit\' param : shoul be from 1 to 100");

        if (offset) request["offset"] = offset;
        request["limit"] = limit;
        request["timeout"] = timeout;

        if (allowed !is null)
            request["allowed_updates"] = allowed;

        TelegramVariant variantResult = execute!(TelegramVariant)("getUpdates", request);
        return toTelegram!(TelegramUpdate)(variantResult.getAsJson());
    }

    /** 
     * Use this method to get current webhook status
     * Returns: On success, returns a WebhookInfo object.
     */
    public TelegramWebhookInfo getWebhookInfo () {
        return execute!TelegramWebhookInfo("getWebhookInfo");
    }

    /** 
     * Use this method to specify a url and receive incoming updates via an outgoing webhook
     * Params:
     *   url = HTTPS url to send updates to
     *   certificate = Upload your public key certificate so that the root certificate in use can be checked
     *   ip = The fixed IP address which will be used to send webhook requests instead of the IP address resolved through DNS
     *   max = Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery, 1-100
     *   allowed = A JSON-serialized list of the update types you want your bot to receive
     *   drop = Pass True to drop all pending updates
     * Returns: Returns True on success
     */
    public bool setWebhook (string url,
                            TelegramInputFile certificate = null,
                            string ip = "",
                            ulong max = 40,
                            string [] allowed = null,
                            bool drop = false) {
        JSONValue request = parseJSON("{}");

        if (url == "") throw new TelegramException ("Incorrect \'url\' : it is empty");
        if (max < 1 || max > 40) throw new TelegramException ("Incorrect \'max_connections\' : it should be from 1 to 40");

        request["url"] = url;

        if (certificate !is null) request["certificate"] = certificate.getAsJson();
        if (ip != "") request["ip_address"] = ip;
        request["max_connections"] = max;
        if (allowed !is null) request["allowed_updates"] = allowed;
        request["drop_pending_updates"] = drop;

        return execute("setWebhook", request).boolean();
    }

    /** 
     * Use this method to remove webhook integration if you decide to switch back to getUpdates.
     * Params:
     *   drop = Pass True to drop all pending updates 
     * Returns: Returns True on success.
     */
    public bool deleteWebhook (bool drop = false) {
        JSONValue request = parseJSON("{}");
        request["drop_pending_updates	"] = drop;
        return execute("deleteWebhook", request).boolean();
    }
}
