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
     * Use this method to send static .WEBP or animated .TGS stickers.
     * Params:
     *   id = Unique identifier for the target chat or username of the target channel
     *   sticker = Sticker to send
     *   disableNotification = Sends the message silently. 
     *   replyToMessageId = If the message is a reply, ID of the original message
     *   allowSendingWithoutReply = Pass True, if the message should be sent even if the specified replied-to message is not found
     *   markup = Additional interface options
     * Returns: On success, the sent Message is returned
     */
    public TelegramMessage sendSticker (T, U) (T id,
                                               TelegramInputFile sticker,
                                               bool disableNotification = false,
                                               ulong replyToMessageId = 0,
                                               bool allowSendingWithoutReply = false,
                                               U markup = null) if ((is (T == string) || is (T == ulong)) && (is (U == TelegramInlineKeyboardMarkup) || is (U == TelegramReplyKeyboardMarkup) || is (U == TelegramReplyKeyboardRemove) || is (U == TelegramForceReply) || is (U == typeof(null)))) {
        MultipartForm request;

        request.add(formData ("chat_id", to!string(id)));
        
        if (sticker.type != InputFileType.LocalFile) request.add(formData ("sticker", sticker.getAsJson().str()));
        else {
            import std.file : DirEntry;
            auto img = DirEntry(sticker.getAsJson().str());
            request.add(formData ("sticker", File(sticker.getAsJson().str(), "rb"), ["filename":img.name, "Content-Type": "multipart/form-data"]));
        }

        request.add(formData ("disable_notification", to!string(disableNotification)));
        if (replyToMessageId) request.add(formData ("reply_to_message_id", to!string(replyToMessageId)));
        request.add(formData ("allow_sending_without_reply", to!string(allowSendingWithoutReply)));

        if (markup !is null) request.add(formData("reply_markup", markup.getAsJson().toString(), ["Content-Type":"application/json"]));

        return execute!TelegramMessage("sendSticker", request);
    }

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

    /** 
     * Use this method to upload a .PNG file with a sticker
     * Params:
     *   id = 	User identifier of sticker file owner
     *   sticker = PNG image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px
     * Returns: Returns the uploaded File on success
     */
    public TelegramFile uploadStickerFile (ulong id, TelegramInputFile sticker) {
        if (sticker.type != InputFileType.LocalFile) throw new TelegramException ("Incorrect input file : must be local");

        import std.file : DirEntry;
        auto img = DirEntry(sticker.getAsJson().str());

        MultipartForm request;

        request.add(formData ("user_id", to!string(id)));
        request.add(formData ("png_sticker", File(sticker.getAsJson().str(), "rb"), ["filename":img.name, "Content-Type": "multipart/form-data"]));

        return execute!TelegramFile("uploadStickerFile", request);
    }

    /** 
     * Use this method to create a new sticker set owned by a user. 
     * Params:
     *   id = User identifier of created sticker set owner
     *   name = Short name of sticker set
     *   title = Sticker set title, 1-64 characters
     *   png = PNG image with the sticker
     *   tgs = TGS animation with the sticker
     *   emojis = One or more emoji corresponding to the sticker
     *   masks = Pass True, if a set of mask stickers should be created
     *   pos = A JSON-serialized object for position where the mask should be placed on faces
     * Returns: Returns True on success
     */
    public bool createNewStickerSet (ulong id,
                                     string name,
                                     string title,
                                     TelegramInputFile png = null,
                                     TelegramInputFile tgs = null,
                                     string emojis = "",
                                     bool masks = false,
                                     TelegramMaskPosition pos = null) {
        MultipartForm request;

        request.add(formData ("user_id", to!string(id)));
        request.add(formData ("name", name));
        request.add(formData ("title", title));

        if (png is null && tgs is null) throw new TelegramException ("You should send tgs or png sticker");
        if (png !is null) {
            if (png.type == InputFileType.LocalFile) {
                import std.file : DirEntry;
                auto img = DirEntry(png.getAsJson().str());
                request.add(formData ("png_sticker", File(png.getAsJson().str(), "rb"), ["filename":img.name, "Content-Type": "multipart/form-data"]));
            } else {
                request.add(formData("png_sticker", png.getAsJson().str()));
            }
        }
        else {
            if (tgs.type == InputFileType.LocalFile) {
                import std.file : DirEntry;
                auto img = DirEntry(tgs.getAsJson().str());
                request.add(formData ("tgs_sticker", File(tgs.getAsJson().str(), "rb"), ["filename":img.name, "Content-Type": "multipart/form-data"]));
            } else {
                request.add(formData("tgs_sticker", tgs.getAsJson().str()));
            }
        }

        request.add(formData ("emojis", emojis));
        request.add(formData ("contains_masks", to!string(masks)));

        if (pos !is null) request.add (formData("mask_position", pos.getAsJson().toString(), ["Content-Type": "application/json"]));

        return execute("createNewStickerSet", request).boolean();
    }

    /** 
     * Use this method to add a new sticker to a set created by the bot.
     * Params:
     *   id = 	User identifier of sticker set owner
     *   name = Sticker set name
     *   png = PNG image with the sticker
     *   tgs = TGS animation with the sticker
     *   emojis = One or more emoji corresponding to the sticker
     *   pos = A JSON-serialized object for position where the mask should be placed on faces
     * Returns: Returns True on success.
     */
    public bool addStickerToSet (ulong id,
                                 string name,
                                 TelegramInputFile png = null,
                                 TelegramInputFile tgs = null,
                                 string emojis = "",
                                 TelegramMaskPosition pos = null) {
        MultipartForm request;

        request.add(formData ("user_id", to!string(id)));
        request.add(formData ("name", name));

        if (png is null && tgs is null) throw new TelegramException ("You should send tgs or png sticker");
        if (png !is null) {
            if (png.type == InputFileType.LocalFile) {
                import std.file : DirEntry;
                auto img = DirEntry(png.getAsJson().str());
                request.add(formData ("png_sticker", File(png.getAsJson().str(), "rb"), ["filename":img.name, "Content-Type": "multipart/form-data"]));
            } else {
                request.add(formData("png_sticker", png.getAsJson().str()));
            }
        }
        else {
            if (tgs.type == InputFileType.LocalFile) {
                import std.file : DirEntry;
                auto img = DirEntry(tgs.getAsJson().str());
                request.add(formData ("tgs_sticker", File(tgs.getAsJson().str(), "rb"), ["filename":img.name, "Content-Type": "multipart/form-data"]));
            } else {
                request.add(formData("tgs_sticker", tgs.getAsJson().str()));
            }
        }

        request.add(formData ("emojis", emojis));

        if (pos !is null) request.add (formData("mask_position", pos.getAsJson().toString(), ["Content-Type": "application/json"]));

        return execute("addStickerToSet", request).boolean();
    }

    /** 
     * Use this method to move a sticker in a set created by the bot to a specific position
     * Params:
     *   sticker = File identifier of the sticker
     *   position = New sticker position in the set, zero-based
     * Returns: Returns True on success
     */
    public bool setStickerPositionInSet (string sticker,
                                         ulong position) {
        JSONValue request = parseJSON("");

        request["sticker"] = sticker;
        request["position"] = position;

        return execute("setStickerPositionInSet", request).boolean();
    }

    /** 
     * Use this method to delete a sticker from a set created by the bot.
     * Params:
     *   sticker = File identifier of the sticker
     * Returns: Returns True on success.
     */
    public bool deleteStickerFromSet (string sticker) {
        JSONValue request = parseJSON("");

        request["sticker"] = sticker;

        return execute("deleteStickerFromSet", request).boolean();
    }

    /** 
     * Use this method to set the thumbnail of a sticker set
     * Params:
     *   name = Sticker set name
     *   id = User identifier of the sticker set owner
     *   thumb = A PNG image with the thumbnail
     * Returns: Returns True on success
     */
    public bool setStickerSetThumb (string name,
                                    ulong id,
                                    TelegramInputFile thumb = null) {
        MultipartForm request;

        request.add(formData ("name", name));
        request.add(formData ("user_id", to!string(id)));

        if (thumb !is null) {
            if (thumb.type != InputFileType.LocalFile) request.add(formData ("thumb", thumb.getAsJson().str()));
            else {
                import std.file : DirEntry;
                auto img = DirEntry(thumb.getAsJson().str());
                request.add(formData ("thumb", File(thumb.getAsJson().str(), "rb"), ["filename":img.name, "Content-Type": "multipart/form-data"]));
            }
        }

        return execute("setStickerSetThumb", request).boolean();
    }
}
