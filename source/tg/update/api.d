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

        if (allowed !is null) {
            request["allowed_updates"] = parseJSON("[]");
            foreach (update; allowed) {
                request["allowed_updates"] ~= update;
            }
        }

        TelegramVariant variantResult = execute!(TelegramVariant)("getUpdates", request);
        TelegramUpdate [] result = new TelegramUpdate[0];

        foreach (update; variantResult.getAsJson().array()) {
            result.length += 1; result [$ - 1] = new TelegramUpdate(update);
            debug {
                import std.stdio;
                writeln(update);
            }
        }

        return result;
    }
}
