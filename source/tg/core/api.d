/** 
 * Standart bot`s method
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: 1 Aug 2021
 */
module tg.core.api;

/** Import tg core */
import tg.core.type, tg.core.exception, tg.type;
/** Import JSON lib */
import std.json;

/** 
 * Standart method for import to the TelegramVot
 */
mixin template CoreBotApi () {
    /** 
     * Get information abot bot
     * Throws: Telegram exception if the user is not a bot
     * Returns: Information abot the bot
     */
    public TelegramUser getMe () {
        TelegramUser result = execute!(TelegramUser)("getMe");

        if (result.isBot == false)
            throw new TelegramException ("Cannot authorize bot : it is not bot");

        return result;
    }

    /** 
     * Use this method to log out from the cloud Bot API server before launching the bot locally
     * Returns: True on success
     */
    public bool logOut () {
        return execute("logOut").boolean();
    }

    /** 
     * Use this method to close the bot instance before moving it from one local server to another.
     * Returns: True on success
     */
    public bool close () {
        return execute("close").boolean();
    }
}