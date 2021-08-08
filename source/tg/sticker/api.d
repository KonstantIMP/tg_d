/**
 * Sticker methods
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: 3 Aug 2021
 */
module tg.sticker.api;

/** Import tg core */
import tg.core.type, tg.core.exception, tg.type;
/** Import JSON lib */
import std.json;

/** 
 * Sticker API
 */
mixin template StickerBotApi () {
    /** 
     * Use this method to get a sticker set
     * Params:
     *   name = 	Name of the sticker set
     * Returns: On success, a StickerSet object is returned
     */
    public TelegramStickerSet getStickerSet (string name) {
        JSONValue request = parseJSON("");

        request["name"] = name;

        return execute!TelegramStickerSet("getStickerSet", request);
    }
}
