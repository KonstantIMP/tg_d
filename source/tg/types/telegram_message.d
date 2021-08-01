/**
 * Contains TelegramMessage
 */
module tg.types.telegram_message;

import tg.core.type, tg.core.exception, tg.core.array;
import std.json, tg.type;

/**
 * This object represents a message.
 */
class TelegramMessage : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _message_id = 0;
        _from = null;
        _sender_chat = null;
        _date = 0;
        _chat = null;
        _forward_from = null;
        _forward_from_chat = null;
        _forward_from_message_id = 0;
        _forward_signature = "";
        _forward_sender_name = "";
        _forward_date = 0;
        _reply_to_message = null;
        _via_bot = null;
        _edit_date = 0;
        _media_group_id = "";
        _author_signature = "";
        _text = "";
        _entities = null;
        _animation = null;
        _audio = null;
        _document = null;
        _photo = null;
        _sticker = null;
        _video = null;
        _video_note = null;
        _voice = null;
        _caption = "";
        _caption_entities = null;
        _contact = null;
        _dice = null;
        _game = null;
        _poll = null;
        _venue = null;
        _location = null;
        _new_chat_members = null;
        _left_chat_member = null;
        _new_chat_title = "";
        _new_chat_photo = null;
        _delete_chat_photo = false;
        _group_chat_created = false;
        _supergroup_chat_created = false;
        _channel_chat_created = false;
        _message_auto_delete_timer_changed = null;
        _migrate_to_chat_id = 0;
        _migrate_from_chat_id = 0;
        _pinned_message = null;
        _invoice = null;
        _successful_payment = null;
        _connected_website = "";
        _passport_data = null;
        _proximity_alert_triggered = null;
        _voice_chat_scheduled = null;
        _voice_chat_started = null;
        _voice_chat_ended = null;
        _voice_chat_participants_invited = null;
        _reply_markup = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "message_id" !in data ) throw new TelegramException("Could not find reqired entry : message_id");
        _message_id = data["message_id"].integer();

        if ( "from" in data )
        _from = new TelegramUser(data["from"]);

        if ( "sender_chat" in data )
        _sender_chat = new TelegramChat(data["sender_chat"]);

        if ( "date" !in data ) throw new TelegramException("Could not find reqired entry : date");
        _date = data["date"].integer();

        if ( "chat" !in data ) throw new TelegramException("Could not find reqired entry : chat");
        _chat = new TelegramChat(data["chat"]);

        if ( "forward_from" in data )
        _forward_from = new TelegramUser(data["forward_from"]);

        if ( "forward_from_chat" in data )
        _forward_from_chat = new TelegramChat(data["forward_from_chat"]);

        if ( "forward_from_message_id" in data )
        _forward_from_message_id = data["forward_from_message_id"].integer();

        if ( "forward_signature" in data )
        _forward_signature = data["forward_signature"].str();

        if ( "forward_sender_name" in data )
        _forward_sender_name = data["forward_sender_name"].str();

        if ( "forward_date" in data )
        _forward_date = data["forward_date"].integer();

        if ( "reply_to_message" in data )
        _reply_to_message = new TelegramMessage(data["reply_to_message"]);

        if ( "via_bot" in data )
        _via_bot = new TelegramUser(data["via_bot"]);

        if ( "edit_date" in data )
        _edit_date = data["edit_date"].integer();

        if ( "media_group_id" in data )
        _media_group_id = data["media_group_id"].str();

        if ( "author_signature" in data )
        _author_signature = data["author_signature"].str();

        if ( "text" in data )
        _text = data["text"].str();

        if ( "entities" in data )
        _entities = toTelegram!TelegramMessageEntity(data["entities"]);

        if ( "animation" in data )
        _animation = new TelegramAnimation(data["animation"]);

        if ( "audio" in data )
        _audio = new TelegramAudio(data["audio"]);

        if ( "document" in data )
        _document = new TelegramDocument(data["document"]);

        if ( "photo" in data )
        _photo = toTelegram!TelegramPhotoSize(data["photo"]);

        if ( "sticker" in data )
        _sticker = new TelegramSticker(data["sticker"]);

        if ( "video" in data )
        _video = new TelegramVideo(data["video"]);

        if ( "video_note" in data )
        _video_note = new TelegramVideoNote(data["video_note"]);

        if ( "voice" in data )
        _voice = new TelegramVoice(data["voice"]);

        if ( "caption" in data )
        _caption = data["caption"].str();

        if ( "caption_entities" in data )
        _caption_entities = toTelegram!TelegramMessageEntity(data["caption_entities"]);

        if ( "contact" in data )
        _contact = new TelegramContact(data["contact"]);

        if ( "dice" in data )
        _dice = new TelegramDice(data["dice"]);

        if ( "game" in data )
        _game = new TelegramGame(data["game"]);

        if ( "poll" in data )
        _poll = new TelegramPoll(data["poll"]);

        if ( "venue" in data )
        _venue = new TelegramVenue(data["venue"]);

        if ( "location" in data )
        _location = new TelegramLocation(data["location"]);

        if ( "new_chat_members" in data )
        _new_chat_members = toTelegram!TelegramUser(data["new_chat_members"]);

        if ( "left_chat_member" in data )
        _left_chat_member = new TelegramUser(data["left_chat_member"]);

        if ( "new_chat_title" in data )
        _new_chat_title = data["new_chat_title"].str();

        if ( "new_chat_photo" in data )
        _new_chat_photo = toTelegram!TelegramPhotoSize(data["new_chat_photo"]);

        if ( "delete_chat_photo" in data )
        _delete_chat_photo = data["delete_chat_photo"].boolean();

        if ( "group_chat_created" in data )
        _group_chat_created = data["group_chat_created"].boolean();

        if ( "supergroup_chat_created" in data )
        _supergroup_chat_created = data["supergroup_chat_created"].boolean();

        if ( "channel_chat_created" in data )
        _channel_chat_created = data["channel_chat_created"].boolean();

        if ( "message_auto_delete_timer_changed" in data )
        _message_auto_delete_timer_changed = new TelegramMessageAutoDeleteTimerChanged(data["message_auto_delete_timer_changed"]);

        if ( "migrate_to_chat_id" in data )
        _migrate_to_chat_id = data["migrate_to_chat_id"].integer();

        if ( "migrate_from_chat_id" in data )
        _migrate_from_chat_id = data["migrate_from_chat_id"].integer();

        if ( "pinned_message" in data )
        _pinned_message = new TelegramMessage(data["pinned_message"]);

        if ( "invoice" in data )
        _invoice = new TelegramInvoice(data["invoice"]);

        if ( "successful_payment" in data )
        _successful_payment = new TelegramSuccessfulPayment(data["successful_payment"]);

        if ( "connected_website" in data )
        _connected_website = data["connected_website"].str();

        if ( "passport_data" in data )
        _passport_data = new TelegramPassportData(data["passport_data"]);

        if ( "proximity_alert_triggered" in data )
        _proximity_alert_triggered = new TelegramProximityAlertTriggered(data["proximity_alert_triggered"]);

        if ( "voice_chat_scheduled" in data )
        _voice_chat_scheduled = new TelegramVoiceChatScheduled(data["voice_chat_scheduled"]);

        if ( "voice_chat_started" in data )
        _voice_chat_started = new TelegramVoiceChatStarted(data["voice_chat_started"]);

        if ( "voice_chat_ended" in data )
        _voice_chat_ended = new TelegramVoiceChatEnded(data["voice_chat_ended"]);

        if ( "voice_chat_participants_invited" in data )
        _voice_chat_participants_invited = new TelegramVoiceChatParticipantsInvited(data["voice_chat_participants_invited"]);

        if ( "reply_markup" in data )
        _reply_markup = new TelegramInlineKeyboardMarkup(data["reply_markup"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["message_id"] = _message_id;

        if ( _from !is null ) data["from"] = _from.getAsJson();

        if ( _sender_chat !is null ) data["sender_chat"] = _sender_chat.getAsJson();

        data["date"] = _date;

        data["chat"] = _chat.getAsJson();

        if ( _forward_from !is null ) data["forward_from"] = _forward_from.getAsJson();

        if ( _forward_from_chat !is null ) data["forward_from_chat"] = _forward_from_chat.getAsJson();

        if ( _forward_from_message_id != 0 ) data["forward_from_message_id"] = _forward_from_message_id;

        if ( _forward_signature != "" ) data["forward_signature"] = _forward_signature;

        if ( _forward_sender_name != "" ) data["forward_sender_name"] = _forward_sender_name;

        if ( _forward_date != 0 ) data["forward_date"] = _forward_date;

        if ( _reply_to_message !is null ) data["reply_to_message"] = _reply_to_message.getAsJson();

        if ( _via_bot !is null ) data["via_bot"] = _via_bot.getAsJson();

        if ( _edit_date != 0 ) data["edit_date"] = _edit_date;

        if ( _media_group_id != "" ) data["media_group_id"] = _media_group_id;

        if ( _author_signature != "" ) data["author_signature"] = _author_signature;

        if ( _text != "" ) data["text"] = _text;

        if ( _entities !is null ) data["entities"] = _entities.getAsJson();

        if ( _animation !is null ) data["animation"] = _animation.getAsJson();

        if ( _audio !is null ) data["audio"] = _audio.getAsJson();

        if ( _document !is null ) data["document"] = _document.getAsJson();

        if ( _photo !is null ) data["photo"] = _photo.getAsJson();

        if ( _sticker !is null ) data["sticker"] = _sticker.getAsJson();

        if ( _video !is null ) data["video"] = _video.getAsJson();

        if ( _video_note !is null ) data["video_note"] = _video_note.getAsJson();

        if ( _voice !is null ) data["voice"] = _voice.getAsJson();

        if ( _caption != "" ) data["caption"] = _caption;

        if ( _caption_entities !is null ) data["caption_entities"] = _caption_entities.getAsJson();

        if ( _contact !is null ) data["contact"] = _contact.getAsJson();

        if ( _dice !is null ) data["dice"] = _dice.getAsJson();

        if ( _game !is null ) data["game"] = _game.getAsJson();

        if ( _poll !is null ) data["poll"] = _poll.getAsJson();

        if ( _venue !is null ) data["venue"] = _venue.getAsJson();

        if ( _location !is null ) data["location"] = _location.getAsJson();

        if ( _new_chat_members !is null ) data["new_chat_members"] = _new_chat_members.getAsJson();

        if ( _left_chat_member !is null ) data["left_chat_member"] = _left_chat_member.getAsJson();

        if ( _new_chat_title != "" ) data["new_chat_title"] = _new_chat_title;

        if ( _new_chat_photo !is null ) data["new_chat_photo"] = _new_chat_photo.getAsJson();

        data["delete_chat_photo"] = _delete_chat_photo;

        data["group_chat_created"] = _group_chat_created;

        data["supergroup_chat_created"] = _supergroup_chat_created;

        data["channel_chat_created"] = _channel_chat_created;

        if ( _message_auto_delete_timer_changed !is null ) data["message_auto_delete_timer_changed"] = _message_auto_delete_timer_changed.getAsJson();

        if ( _migrate_to_chat_id != 0 ) data["migrate_to_chat_id"] = _migrate_to_chat_id;

        if ( _migrate_from_chat_id != 0 ) data["migrate_from_chat_id"] = _migrate_from_chat_id;

        if ( _pinned_message !is null ) data["pinned_message"] = _pinned_message.getAsJson();

        if ( _invoice !is null ) data["invoice"] = _invoice.getAsJson();

        if ( _successful_payment !is null ) data["successful_payment"] = _successful_payment.getAsJson();

        if ( _connected_website != "" ) data["connected_website"] = _connected_website;

        if ( _passport_data !is null ) data["passport_data"] = _passport_data.getAsJson();

        if ( _proximity_alert_triggered !is null ) data["proximity_alert_triggered"] = _proximity_alert_triggered.getAsJson();

        if ( _voice_chat_scheduled !is null ) data["voice_chat_scheduled"] = _voice_chat_scheduled.getAsJson();

        if ( _voice_chat_started !is null ) data["voice_chat_started"] = _voice_chat_started.getAsJson();

        if ( _voice_chat_ended !is null ) data["voice_chat_ended"] = _voice_chat_ended.getAsJson();

        if ( _voice_chat_participants_invited !is null ) data["voice_chat_participants_invited"] = _voice_chat_participants_invited.getAsJson();

        if ( _reply_markup !is null ) data["reply_markup"] = _reply_markup.getAsJson();

        return data;
    }

    /** Unique message identifier inside this chat */
    private ulong _message_id;
    /**
     * Getter for '_message_id'
     * Returns: Current value of '_message_id'
     */
    @property ulong messageId () { return _message_id; }
    /**
     * Setter for '_message_id'
     * Params: messageIdNew = New value of '_message_id'
     * Returns: New value of '_message_id'
     */
    @property ulong messageId ( ulong messageIdNew ) { return _message_id = messageIdNew; }

    /** <em>Optional</em>. Sender, empty for messages sent to channels */
    private TelegramUser _from;
    /**
     * Getter for '_from'
     * Returns: Current value of '_from'
     */
    @property TelegramUser from () { return _from; }
    /**
     * Setter for '_from'
     * Params: fromNew = New value of '_from'
     * Returns: New value of '_from'
     */
    @property TelegramUser from ( TelegramUser fromNew ) { return _from = fromNew; }

    /** <em>Optional</em>. Sender of the message, sent on behalf of a chat. The channel itself for channel messages. The supergroup itself for messages from anonymous group administrators. The linked channel for messages automatically forwarded to the discussion group */
    private TelegramChat _sender_chat;
    /**
     * Getter for '_sender_chat'
     * Returns: Current value of '_sender_chat'
     */
    @property TelegramChat senderChat () { return _sender_chat; }
    /**
     * Setter for '_sender_chat'
     * Params: senderChatNew = New value of '_sender_chat'
     * Returns: New value of '_sender_chat'
     */
    @property TelegramChat senderChat ( TelegramChat senderChatNew ) { return _sender_chat = senderChatNew; }

    /** Date the message was sent in Unix time */
    private ulong _date;
    /**
     * Getter for '_date'
     * Returns: Current value of '_date'
     */
    @property ulong date () { return _date; }
    /**
     * Setter for '_date'
     * Params: dateNew = New value of '_date'
     * Returns: New value of '_date'
     */
    @property ulong date ( ulong dateNew ) { return _date = dateNew; }

    /** Conversation the message belongs to */
    private TelegramChat _chat;
    /**
     * Getter for '_chat'
     * Returns: Current value of '_chat'
     */
    @property TelegramChat chat () { return _chat; }
    /**
     * Setter for '_chat'
     * Params: chatNew = New value of '_chat'
     * Returns: New value of '_chat'
     */
    @property TelegramChat chat ( TelegramChat chatNew ) { return _chat = chatNew; }

    /** <em>Optional</em>. For forwarded messages, sender of the original message */
    private TelegramUser _forward_from;
    /**
     * Getter for '_forward_from'
     * Returns: Current value of '_forward_from'
     */
    @property TelegramUser forwardFrom () { return _forward_from; }
    /**
     * Setter for '_forward_from'
     * Params: forwardFromNew = New value of '_forward_from'
     * Returns: New value of '_forward_from'
     */
    @property TelegramUser forwardFrom ( TelegramUser forwardFromNew ) { return _forward_from = forwardFromNew; }

    /** <em>Optional</em>. For messages forwarded from channels or from anonymous administrators, information about the original sender chat */
    private TelegramChat _forward_from_chat;
    /**
     * Getter for '_forward_from_chat'
     * Returns: Current value of '_forward_from_chat'
     */
    @property TelegramChat forwardFromChat () { return _forward_from_chat; }
    /**
     * Setter for '_forward_from_chat'
     * Params: forwardFromChatNew = New value of '_forward_from_chat'
     * Returns: New value of '_forward_from_chat'
     */
    @property TelegramChat forwardFromChat ( TelegramChat forwardFromChatNew ) { return _forward_from_chat = forwardFromChatNew; }

    /** <em>Optional</em>. For messages forwarded from channels, identifier of the original message in the channel */
    private ulong _forward_from_message_id;
    /**
     * Getter for '_forward_from_message_id'
     * Returns: Current value of '_forward_from_message_id'
     */
    @property ulong forwardFromMessageId () { return _forward_from_message_id; }
    /**
     * Setter for '_forward_from_message_id'
     * Params: forwardFromMessageIdNew = New value of '_forward_from_message_id'
     * Returns: New value of '_forward_from_message_id'
     */
    @property ulong forwardFromMessageId ( ulong forwardFromMessageIdNew ) { return _forward_from_message_id = forwardFromMessageIdNew; }

    /** <em>Optional</em>. For messages forwarded from channels, signature of the post author if present */
    private string _forward_signature;
    /**
     * Getter for '_forward_signature'
     * Returns: Current value of '_forward_signature'
     */
    @property string forwardSignature () { return _forward_signature; }
    /**
     * Setter for '_forward_signature'
     * Params: forwardSignatureNew = New value of '_forward_signature'
     * Returns: New value of '_forward_signature'
     */
    @property string forwardSignature ( string forwardSignatureNew ) { return _forward_signature = forwardSignatureNew; }

    /** <em>Optional</em>. Sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages */
    private string _forward_sender_name;
    /**
     * Getter for '_forward_sender_name'
     * Returns: Current value of '_forward_sender_name'
     */
    @property string forwardSenderName () { return _forward_sender_name; }
    /**
     * Setter for '_forward_sender_name'
     * Params: forwardSenderNameNew = New value of '_forward_sender_name'
     * Returns: New value of '_forward_sender_name'
     */
    @property string forwardSenderName ( string forwardSenderNameNew ) { return _forward_sender_name = forwardSenderNameNew; }

    /** <em>Optional</em>. For forwarded messages, date the original message was sent in Unix time */
    private ulong _forward_date;
    /**
     * Getter for '_forward_date'
     * Returns: Current value of '_forward_date'
     */
    @property ulong forwardDate () { return _forward_date; }
    /**
     * Setter for '_forward_date'
     * Params: forwardDateNew = New value of '_forward_date'
     * Returns: New value of '_forward_date'
     */
    @property ulong forwardDate ( ulong forwardDateNew ) { return _forward_date = forwardDateNew; }

    /** <em>Optional</em>. For replies, the original message. Note that the Message object in this field will not contain further <em>reply_to_message</em> fields even if it itself is a reply. */
    private TelegramMessage _reply_to_message;
    /**
     * Getter for '_reply_to_message'
     * Returns: Current value of '_reply_to_message'
     */
    @property TelegramMessage replyToMessage () { return _reply_to_message; }
    /**
     * Setter for '_reply_to_message'
     * Params: replyToMessageNew = New value of '_reply_to_message'
     * Returns: New value of '_reply_to_message'
     */
    @property TelegramMessage replyToMessage ( TelegramMessage replyToMessageNew ) { return _reply_to_message = replyToMessageNew; }

    /** <em>Optional</em>. Bot through which the message was sent */
    private TelegramUser _via_bot;
    /**
     * Getter for '_via_bot'
     * Returns: Current value of '_via_bot'
     */
    @property TelegramUser viaBot () { return _via_bot; }
    /**
     * Setter for '_via_bot'
     * Params: viaBotNew = New value of '_via_bot'
     * Returns: New value of '_via_bot'
     */
    @property TelegramUser viaBot ( TelegramUser viaBotNew ) { return _via_bot = viaBotNew; }

    /** <em>Optional</em>. Date the message was last edited in Unix time */
    private ulong _edit_date;
    /**
     * Getter for '_edit_date'
     * Returns: Current value of '_edit_date'
     */
    @property ulong editDate () { return _edit_date; }
    /**
     * Setter for '_edit_date'
     * Params: editDateNew = New value of '_edit_date'
     * Returns: New value of '_edit_date'
     */
    @property ulong editDate ( ulong editDateNew ) { return _edit_date = editDateNew; }

    /** <em>Optional</em>. The unique identifier of a media message group this message belongs to */
    private string _media_group_id;
    /**
     * Getter for '_media_group_id'
     * Returns: Current value of '_media_group_id'
     */
    @property string mediaGroupId () { return _media_group_id; }
    /**
     * Setter for '_media_group_id'
     * Params: mediaGroupIdNew = New value of '_media_group_id'
     * Returns: New value of '_media_group_id'
     */
    @property string mediaGroupId ( string mediaGroupIdNew ) { return _media_group_id = mediaGroupIdNew; }

    /** <em>Optional</em>. Signature of the post author for messages in channels, or the custom title of an anonymous group administrator */
    private string _author_signature;
    /**
     * Getter for '_author_signature'
     * Returns: Current value of '_author_signature'
     */
    @property string authorSignature () { return _author_signature; }
    /**
     * Setter for '_author_signature'
     * Params: authorSignatureNew = New value of '_author_signature'
     * Returns: New value of '_author_signature'
     */
    @property string authorSignature ( string authorSignatureNew ) { return _author_signature = authorSignatureNew; }

    /** <em>Optional</em>. For text messages, the actual UTF-8 text of the message, 0-4096 characters */
    private string _text;
    /**
     * Getter for '_text'
     * Returns: Current value of '_text'
     */
    @property string text () { return _text; }
    /**
     * Setter for '_text'
     * Params: textNew = New value of '_text'
     * Returns: New value of '_text'
     */
    @property string text ( string textNew ) { return _text = textNew; }

    /** <em>Optional</em>. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text */
    private TelegramMessageEntity[] _entities;
    /**
     * Getter for '_entities'
     * Returns: Current value of '_entities'
     */
    @property TelegramMessageEntity[] entities () { return _entities; }
    /**
     * Setter for '_entities'
     * Params: entitiesNew = New value of '_entities'
     * Returns: New value of '_entities'
     */
    @property TelegramMessageEntity[] entities ( TelegramMessageEntity[] entitiesNew ) { return _entities = entitiesNew; }

    /** <em>Optional</em>. Message is an animation, information about the animation. For backward compatibility, when this field is set, the <em>document</em> field will also be set */
    private TelegramAnimation _animation;
    /**
     * Getter for '_animation'
     * Returns: Current value of '_animation'
     */
    @property TelegramAnimation animation () { return _animation; }
    /**
     * Setter for '_animation'
     * Params: animationNew = New value of '_animation'
     * Returns: New value of '_animation'
     */
    @property TelegramAnimation animation ( TelegramAnimation animationNew ) { return _animation = animationNew; }

    /** <em>Optional</em>. Message is an audio file, information about the file */
    private TelegramAudio _audio;
    /**
     * Getter for '_audio'
     * Returns: Current value of '_audio'
     */
    @property TelegramAudio audio () { return _audio; }
    /**
     * Setter for '_audio'
     * Params: audioNew = New value of '_audio'
     * Returns: New value of '_audio'
     */
    @property TelegramAudio audio ( TelegramAudio audioNew ) { return _audio = audioNew; }

    /** <em>Optional</em>. Message is a general file, information about the file */
    private TelegramDocument _document;
    /**
     * Getter for '_document'
     * Returns: Current value of '_document'
     */
    @property TelegramDocument document () { return _document; }
    /**
     * Setter for '_document'
     * Params: documentNew = New value of '_document'
     * Returns: New value of '_document'
     */
    @property TelegramDocument document ( TelegramDocument documentNew ) { return _document = documentNew; }

    /** <em>Optional</em>. Message is a photo, available sizes of the photo */
    private TelegramPhotoSize[] _photo;
    /**
     * Getter for '_photo'
     * Returns: Current value of '_photo'
     */
    @property TelegramPhotoSize[] photo () { return _photo; }
    /**
     * Setter for '_photo'
     * Params: photoNew = New value of '_photo'
     * Returns: New value of '_photo'
     */
    @property TelegramPhotoSize[] photo ( TelegramPhotoSize[] photoNew ) { return _photo = photoNew; }

    /** <em>Optional</em>. Message is a sticker, information about the sticker */
    private TelegramSticker _sticker;
    /**
     * Getter for '_sticker'
     * Returns: Current value of '_sticker'
     */
    @property TelegramSticker sticker () { return _sticker; }
    /**
     * Setter for '_sticker'
     * Params: stickerNew = New value of '_sticker'
     * Returns: New value of '_sticker'
     */
    @property TelegramSticker sticker ( TelegramSticker stickerNew ) { return _sticker = stickerNew; }

    /** <em>Optional</em>. Message is a video, information about the video */
    private TelegramVideo _video;
    /**
     * Getter for '_video'
     * Returns: Current value of '_video'
     */
    @property TelegramVideo video () { return _video; }
    /**
     * Setter for '_video'
     * Params: videoNew = New value of '_video'
     * Returns: New value of '_video'
     */
    @property TelegramVideo video ( TelegramVideo videoNew ) { return _video = videoNew; }

    /** <em>Optional</em>. Message is a video note, information about the video message */
    private TelegramVideoNote _video_note;
    /**
     * Getter for '_video_note'
     * Returns: Current value of '_video_note'
     */
    @property TelegramVideoNote videoNote () { return _video_note; }
    /**
     * Setter for '_video_note'
     * Params: videoNoteNew = New value of '_video_note'
     * Returns: New value of '_video_note'
     */
    @property TelegramVideoNote videoNote ( TelegramVideoNote videoNoteNew ) { return _video_note = videoNoteNew; }

    /** <em>Optional</em>. Message is a voice message, information about the file */
    private TelegramVoice _voice;
    /**
     * Getter for '_voice'
     * Returns: Current value of '_voice'
     */
    @property TelegramVoice voice () { return _voice; }
    /**
     * Setter for '_voice'
     * Params: voiceNew = New value of '_voice'
     * Returns: New value of '_voice'
     */
    @property TelegramVoice voice ( TelegramVoice voiceNew ) { return _voice = voiceNew; }

    /** <em>Optional</em>. Caption for the animation, audio, document, photo, video or voice, 0-1024 characters */
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

    /** <em>Optional</em>. For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption */
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

    /** <em>Optional</em>. Message is a shared contact, information about the contact */
    private TelegramContact _contact;
    /**
     * Getter for '_contact'
     * Returns: Current value of '_contact'
     */
    @property TelegramContact contact () { return _contact; }
    /**
     * Setter for '_contact'
     * Params: contactNew = New value of '_contact'
     * Returns: New value of '_contact'
     */
    @property TelegramContact contact ( TelegramContact contactNew ) { return _contact = contactNew; }

    /** <em>Optional</em>. Message is a dice with random value */
    private TelegramDice _dice;
    /**
     * Getter for '_dice'
     * Returns: Current value of '_dice'
     */
    @property TelegramDice dice () { return _dice; }
    /**
     * Setter for '_dice'
     * Params: diceNew = New value of '_dice'
     * Returns: New value of '_dice'
     */
    @property TelegramDice dice ( TelegramDice diceNew ) { return _dice = diceNew; }

    /** <em>Optional</em>. Message is a game, information about the game. More about games &#187; */
    private TelegramGame _game;
    /**
     * Getter for '_game'
     * Returns: Current value of '_game'
     */
    @property TelegramGame game () { return _game; }
    /**
     * Setter for '_game'
     * Params: gameNew = New value of '_game'
     * Returns: New value of '_game'
     */
    @property TelegramGame game ( TelegramGame gameNew ) { return _game = gameNew; }

    /** <em>Optional</em>. Message is a native poll, information about the poll */
    private TelegramPoll _poll;
    /**
     * Getter for '_poll'
     * Returns: Current value of '_poll'
     */
    @property TelegramPoll poll () { return _poll; }
    /**
     * Setter for '_poll'
     * Params: pollNew = New value of '_poll'
     * Returns: New value of '_poll'
     */
    @property TelegramPoll poll ( TelegramPoll pollNew ) { return _poll = pollNew; }

    /** <em>Optional</em>. Message is a venue, information about the venue. For backward compatibility, when this field is set, the <em>location</em> field will also be set */
    private TelegramVenue _venue;
    /**
     * Getter for '_venue'
     * Returns: Current value of '_venue'
     */
    @property TelegramVenue venue () { return _venue; }
    /**
     * Setter for '_venue'
     * Params: venueNew = New value of '_venue'
     * Returns: New value of '_venue'
     */
    @property TelegramVenue venue ( TelegramVenue venueNew ) { return _venue = venueNew; }

    /** <em>Optional</em>. Message is a shared location, information about the location */
    private TelegramLocation _location;
    /**
     * Getter for '_location'
     * Returns: Current value of '_location'
     */
    @property TelegramLocation location () { return _location; }
    /**
     * Setter for '_location'
     * Params: locationNew = New value of '_location'
     * Returns: New value of '_location'
     */
    @property TelegramLocation location ( TelegramLocation locationNew ) { return _location = locationNew; }

    /** <em>Optional</em>. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members) */
    private TelegramUser[] _new_chat_members;
    /**
     * Getter for '_new_chat_members'
     * Returns: Current value of '_new_chat_members'
     */
    @property TelegramUser[] newChatMembers () { return _new_chat_members; }
    /**
     * Setter for '_new_chat_members'
     * Params: newChatMembersNew = New value of '_new_chat_members'
     * Returns: New value of '_new_chat_members'
     */
    @property TelegramUser[] newChatMembers ( TelegramUser[] newChatMembersNew ) { return _new_chat_members = newChatMembersNew; }

    /** <em>Optional</em>. A member was removed from the group, information about them (this member may be the bot itself) */
    private TelegramUser _left_chat_member;
    /**
     * Getter for '_left_chat_member'
     * Returns: Current value of '_left_chat_member'
     */
    @property TelegramUser leftChatMember () { return _left_chat_member; }
    /**
     * Setter for '_left_chat_member'
     * Params: leftChatMemberNew = New value of '_left_chat_member'
     * Returns: New value of '_left_chat_member'
     */
    @property TelegramUser leftChatMember ( TelegramUser leftChatMemberNew ) { return _left_chat_member = leftChatMemberNew; }

    /** <em>Optional</em>. A chat title was changed to this value */
    private string _new_chat_title;
    /**
     * Getter for '_new_chat_title'
     * Returns: Current value of '_new_chat_title'
     */
    @property string newChatTitle () { return _new_chat_title; }
    /**
     * Setter for '_new_chat_title'
     * Params: newChatTitleNew = New value of '_new_chat_title'
     * Returns: New value of '_new_chat_title'
     */
    @property string newChatTitle ( string newChatTitleNew ) { return _new_chat_title = newChatTitleNew; }

    /** <em>Optional</em>. A chat photo was change to this value */
    private TelegramPhotoSize[] _new_chat_photo;
    /**
     * Getter for '_new_chat_photo'
     * Returns: Current value of '_new_chat_photo'
     */
    @property TelegramPhotoSize[] newChatPhoto () { return _new_chat_photo; }
    /**
     * Setter for '_new_chat_photo'
     * Params: newChatPhotoNew = New value of '_new_chat_photo'
     * Returns: New value of '_new_chat_photo'
     */
    @property TelegramPhotoSize[] newChatPhoto ( TelegramPhotoSize[] newChatPhotoNew ) { return _new_chat_photo = newChatPhotoNew; }

    /** <em>Optional</em>. Service message: the chat photo was deleted */
    private bool _delete_chat_photo;
    /**
     * Getter for '_delete_chat_photo'
     * Returns: Current value of '_delete_chat_photo'
     */
    @property bool deleteChatPhoto () { return _delete_chat_photo; }
    /**
     * Setter for '_delete_chat_photo'
     * Params: deleteChatPhotoNew = New value of '_delete_chat_photo'
     * Returns: New value of '_delete_chat_photo'
     */
    @property bool deleteChatPhoto ( bool deleteChatPhotoNew ) { return _delete_chat_photo = deleteChatPhotoNew; }

    /** <em>Optional</em>. Service message: the group has been created */
    private bool _group_chat_created;
    /**
     * Getter for '_group_chat_created'
     * Returns: Current value of '_group_chat_created'
     */
    @property bool groupChatCreated () { return _group_chat_created; }
    /**
     * Setter for '_group_chat_created'
     * Params: groupChatCreatedNew = New value of '_group_chat_created'
     * Returns: New value of '_group_chat_created'
     */
    @property bool groupChatCreated ( bool groupChatCreatedNew ) { return _group_chat_created = groupChatCreatedNew; }

    /** <em>Optional</em>. Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup. */
    private bool _supergroup_chat_created;
    /**
     * Getter for '_supergroup_chat_created'
     * Returns: Current value of '_supergroup_chat_created'
     */
    @property bool supergroupChatCreated () { return _supergroup_chat_created; }
    /**
     * Setter for '_supergroup_chat_created'
     * Params: supergroupChatCreatedNew = New value of '_supergroup_chat_created'
     * Returns: New value of '_supergroup_chat_created'
     */
    @property bool supergroupChatCreated ( bool supergroupChatCreatedNew ) { return _supergroup_chat_created = supergroupChatCreatedNew; }

    /** <em>Optional</em>. Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel. */
    private bool _channel_chat_created;
    /**
     * Getter for '_channel_chat_created'
     * Returns: Current value of '_channel_chat_created'
     */
    @property bool channelChatCreated () { return _channel_chat_created; }
    /**
     * Setter for '_channel_chat_created'
     * Params: channelChatCreatedNew = New value of '_channel_chat_created'
     * Returns: New value of '_channel_chat_created'
     */
    @property bool channelChatCreated ( bool channelChatCreatedNew ) { return _channel_chat_created = channelChatCreatedNew; }

    /** <em>Optional</em>. Service message: auto-delete timer settings changed in the chat */
    private TelegramMessageAutoDeleteTimerChanged _message_auto_delete_timer_changed;
    /**
     * Getter for '_message_auto_delete_timer_changed'
     * Returns: Current value of '_message_auto_delete_timer_changed'
     */
    @property TelegramMessageAutoDeleteTimerChanged messageAutoDeleteTimerChanged () { return _message_auto_delete_timer_changed; }
    /**
     * Setter for '_message_auto_delete_timer_changed'
     * Params: messageAutoDeleteTimerChangedNew = New value of '_message_auto_delete_timer_changed'
     * Returns: New value of '_message_auto_delete_timer_changed'
     */
    @property TelegramMessageAutoDeleteTimerChanged messageAutoDeleteTimerChanged ( TelegramMessageAutoDeleteTimerChanged messageAutoDeleteTimerChangedNew ) { return _message_auto_delete_timer_changed = messageAutoDeleteTimerChangedNew; }

    /** <em>Optional</em>. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier. */
    private ulong _migrate_to_chat_id;
    /**
     * Getter for '_migrate_to_chat_id'
     * Returns: Current value of '_migrate_to_chat_id'
     */
    @property ulong migrateToChatId () { return _migrate_to_chat_id; }
    /**
     * Setter for '_migrate_to_chat_id'
     * Params: migrateToChatIdNew = New value of '_migrate_to_chat_id'
     * Returns: New value of '_migrate_to_chat_id'
     */
    @property ulong migrateToChatId ( ulong migrateToChatIdNew ) { return _migrate_to_chat_id = migrateToChatIdNew; }

    /** <em>Optional</em>. The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier. */
    private ulong _migrate_from_chat_id;
    /**
     * Getter for '_migrate_from_chat_id'
     * Returns: Current value of '_migrate_from_chat_id'
     */
    @property ulong migrateFromChatId () { return _migrate_from_chat_id; }
    /**
     * Setter for '_migrate_from_chat_id'
     * Params: migrateFromChatIdNew = New value of '_migrate_from_chat_id'
     * Returns: New value of '_migrate_from_chat_id'
     */
    @property ulong migrateFromChatId ( ulong migrateFromChatIdNew ) { return _migrate_from_chat_id = migrateFromChatIdNew; }

    /** <em>Optional</em>. Specified message was pinned. Note that the Message object in this field will not contain further <em>reply_to_message</em> fields even if it is itself a reply. */
    private TelegramMessage _pinned_message;
    /**
     * Getter for '_pinned_message'
     * Returns: Current value of '_pinned_message'
     */
    @property TelegramMessage pinnedMessage () { return _pinned_message; }
    /**
     * Setter for '_pinned_message'
     * Params: pinnedMessageNew = New value of '_pinned_message'
     * Returns: New value of '_pinned_message'
     */
    @property TelegramMessage pinnedMessage ( TelegramMessage pinnedMessageNew ) { return _pinned_message = pinnedMessageNew; }

    /** <em>Optional</em>. Message is an invoice for a payment, information about the invoice. More about payments &#187; */
    private TelegramInvoice _invoice;
    /**
     * Getter for '_invoice'
     * Returns: Current value of '_invoice'
     */
    @property TelegramInvoice invoice () { return _invoice; }
    /**
     * Setter for '_invoice'
     * Params: invoiceNew = New value of '_invoice'
     * Returns: New value of '_invoice'
     */
    @property TelegramInvoice invoice ( TelegramInvoice invoiceNew ) { return _invoice = invoiceNew; }

    /** <em>Optional</em>. Message is a service message about a successful payment, information about the payment. More about payments &#187; */
    private TelegramSuccessfulPayment _successful_payment;
    /**
     * Getter for '_successful_payment'
     * Returns: Current value of '_successful_payment'
     */
    @property TelegramSuccessfulPayment successfulPayment () { return _successful_payment; }
    /**
     * Setter for '_successful_payment'
     * Params: successfulPaymentNew = New value of '_successful_payment'
     * Returns: New value of '_successful_payment'
     */
    @property TelegramSuccessfulPayment successfulPayment ( TelegramSuccessfulPayment successfulPaymentNew ) { return _successful_payment = successfulPaymentNew; }

    /** <em>Optional</em>. The domain name of the website on which the user has logged in. More about Telegram Login &#187; */
    private string _connected_website;
    /**
     * Getter for '_connected_website'
     * Returns: Current value of '_connected_website'
     */
    @property string connectedWebsite () { return _connected_website; }
    /**
     * Setter for '_connected_website'
     * Params: connectedWebsiteNew = New value of '_connected_website'
     * Returns: New value of '_connected_website'
     */
    @property string connectedWebsite ( string connectedWebsiteNew ) { return _connected_website = connectedWebsiteNew; }

    /** <em>Optional</em>. Telegram Passport data */
    private TelegramPassportData _passport_data;
    /**
     * Getter for '_passport_data'
     * Returns: Current value of '_passport_data'
     */
    @property TelegramPassportData passportData () { return _passport_data; }
    /**
     * Setter for '_passport_data'
     * Params: passportDataNew = New value of '_passport_data'
     * Returns: New value of '_passport_data'
     */
    @property TelegramPassportData passportData ( TelegramPassportData passportDataNew ) { return _passport_data = passportDataNew; }

    /** <em>Optional</em>. Service message. A user in the chat triggered another user's proximity alert while sharing Live Location. */
    private TelegramProximityAlertTriggered _proximity_alert_triggered;
    /**
     * Getter for '_proximity_alert_triggered'
     * Returns: Current value of '_proximity_alert_triggered'
     */
    @property TelegramProximityAlertTriggered proximityAlertTriggered () { return _proximity_alert_triggered; }
    /**
     * Setter for '_proximity_alert_triggered'
     * Params: proximityAlertTriggeredNew = New value of '_proximity_alert_triggered'
     * Returns: New value of '_proximity_alert_triggered'
     */
    @property TelegramProximityAlertTriggered proximityAlertTriggered ( TelegramProximityAlertTriggered proximityAlertTriggeredNew ) { return _proximity_alert_triggered = proximityAlertTriggeredNew; }

    /** <em>Optional</em>. Service message: voice chat scheduled */
    private TelegramVoiceChatScheduled _voice_chat_scheduled;
    /**
     * Getter for '_voice_chat_scheduled'
     * Returns: Current value of '_voice_chat_scheduled'
     */
    @property TelegramVoiceChatScheduled voiceChatScheduled () { return _voice_chat_scheduled; }
    /**
     * Setter for '_voice_chat_scheduled'
     * Params: voiceChatScheduledNew = New value of '_voice_chat_scheduled'
     * Returns: New value of '_voice_chat_scheduled'
     */
    @property TelegramVoiceChatScheduled voiceChatScheduled ( TelegramVoiceChatScheduled voiceChatScheduledNew ) { return _voice_chat_scheduled = voiceChatScheduledNew; }

    /** <em>Optional</em>. Service message: voice chat started */
    private TelegramVoiceChatStarted _voice_chat_started;
    /**
     * Getter for '_voice_chat_started'
     * Returns: Current value of '_voice_chat_started'
     */
    @property TelegramVoiceChatStarted voiceChatStarted () { return _voice_chat_started; }
    /**
     * Setter for '_voice_chat_started'
     * Params: voiceChatStartedNew = New value of '_voice_chat_started'
     * Returns: New value of '_voice_chat_started'
     */
    @property TelegramVoiceChatStarted voiceChatStarted ( TelegramVoiceChatStarted voiceChatStartedNew ) { return _voice_chat_started = voiceChatStartedNew; }

    /** <em>Optional</em>. Service message: voice chat ended */
    private TelegramVoiceChatEnded _voice_chat_ended;
    /**
     * Getter for '_voice_chat_ended'
     * Returns: Current value of '_voice_chat_ended'
     */
    @property TelegramVoiceChatEnded voiceChatEnded () { return _voice_chat_ended; }
    /**
     * Setter for '_voice_chat_ended'
     * Params: voiceChatEndedNew = New value of '_voice_chat_ended'
     * Returns: New value of '_voice_chat_ended'
     */
    @property TelegramVoiceChatEnded voiceChatEnded ( TelegramVoiceChatEnded voiceChatEndedNew ) { return _voice_chat_ended = voiceChatEndedNew; }

    /** <em>Optional</em>. Service message: new participants invited to a voice chat */
    private TelegramVoiceChatParticipantsInvited _voice_chat_participants_invited;
    /**
     * Getter for '_voice_chat_participants_invited'
     * Returns: Current value of '_voice_chat_participants_invited'
     */
    @property TelegramVoiceChatParticipantsInvited voiceChatParticipantsInvited () { return _voice_chat_participants_invited; }
    /**
     * Setter for '_voice_chat_participants_invited'
     * Params: voiceChatParticipantsInvitedNew = New value of '_voice_chat_participants_invited'
     * Returns: New value of '_voice_chat_participants_invited'
     */
    @property TelegramVoiceChatParticipantsInvited voiceChatParticipantsInvited ( TelegramVoiceChatParticipantsInvited voiceChatParticipantsInvitedNew ) { return _voice_chat_participants_invited = voiceChatParticipantsInvitedNew; }

    /** <em>Optional</em>. Inline keyboard attached to the message. <code>login_url</code> buttons are represented as ordinary <code>url</code> buttons. */
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
}

