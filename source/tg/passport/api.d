/** 
 * Passport bot`s method
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: 2 Aug 2021
 */
module tg.passport.api;

/** Import tg core */
import tg.core.type, tg.core.exception, tg.type;
/** Import JSON lib */
import std.json;

/** 
 * Passport methods for import to the TelegramBot
 */
mixin template PassportBotApi () {
    /** 
     * Informs a user that some of the Telegram Passport elements they provided contains errors.
     * Params:
     *   id = User identifier
     *   errors = A JSON-serialized array describing the errors
     * Returns: Returns True on success
     */
    public bool setPassportDataErrors (ulong id, TelegramPassportElementError [] errors) {
        JSONValue request = parseJSON("");

        request["user_id"] = id; request["errors"] = errors.getAsJson ();

        return execute("setPassportDataErrors", request).boolean();
    }
}
