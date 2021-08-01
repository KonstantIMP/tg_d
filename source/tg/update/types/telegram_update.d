/**
 * Contains TelegramUpdate
 */
module tg.update.types.telegram_update;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object represents an incoming update.<br />At most <strong>one</strong> of the optional parameters can be present in any given update.
 */
class TelegramUpdate : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _update_id = 0;
        _message = null;
        _edited_message = null;
        _channel_post = null;
        _edited_channel_post = null;
        _inline_query = null;
        _chosen_inline_result = null;
        _callback_query = null;
        _shipping_query = null;
        _pre_checkout_query = null;
        _poll = null;
        _poll_answer = null;
        _my_chat_member = null;
        _chat_member = null;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "update_id" !in data ) throw new TelegramException("Could not find reqired entry : update_id");
        _update_id = data["update_id"].integer();

        if ( "message" in data )
        _message = new TelegramMessage(data["message"]);

        if ( "edited_message" in data )
        _edited_message = new TelegramMessage(data["edited_message"]);

        if ( "channel_post" in data )
        _channel_post = new TelegramMessage(data["channel_post"]);

        if ( "edited_channel_post" in data )
        _edited_channel_post = new TelegramMessage(data["edited_channel_post"]);

        if ( "inline_query" in data )
        _inline_query = new TelegramInlineQuery(data["inline_query"]);

        if ( "chosen_inline_result" in data )
        _chosen_inline_result = new TelegramChosenInlineResult(data["chosen_inline_result"]);

        if ( "callback_query" in data )
        _callback_query = new TelegramCallbackQuery(data["callback_query"]);

        if ( "shipping_query" in data )
        _shipping_query = new TelegramShippingQuery(data["shipping_query"]);

        if ( "pre_checkout_query" in data )
        _pre_checkout_query = new TelegramPreCheckoutQuery(data["pre_checkout_query"]);

        if ( "poll" in data )
        _poll = new TelegramPoll(data["poll"]);

        if ( "poll_answer" in data )
        _poll_answer = new TelegramPollAnswer(data["poll_answer"]);

        if ( "my_chat_member" in data )
        _my_chat_member = new TelegramChatMemberUpdated(data["my_chat_member"]);

        if ( "chat_member" in data )
        _chat_member = new TelegramChatMemberUpdated(data["chat_member"]);
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["update_id"] = _update_id;

        if ( _message !is null ) data["message"] = _message.getAsJson();

        if ( _edited_message !is null ) data["edited_message"] = _edited_message.getAsJson();

        if ( _channel_post !is null ) data["channel_post"] = _channel_post.getAsJson();

        if ( _edited_channel_post !is null ) data["edited_channel_post"] = _edited_channel_post.getAsJson();

        if ( _inline_query !is null ) data["inline_query"] = _inline_query.getAsJson();

        if ( _chosen_inline_result !is null ) data["chosen_inline_result"] = _chosen_inline_result.getAsJson();

        if ( _callback_query !is null ) data["callback_query"] = _callback_query.getAsJson();

        if ( _shipping_query !is null ) data["shipping_query"] = _shipping_query.getAsJson();

        if ( _pre_checkout_query !is null ) data["pre_checkout_query"] = _pre_checkout_query.getAsJson();

        if ( _poll !is null ) data["poll"] = _poll.getAsJson();

        if ( _poll_answer !is null ) data["poll_answer"] = _poll_answer.getAsJson();

        if ( _my_chat_member !is null ) data["my_chat_member"] = _my_chat_member.getAsJson();

        if ( _chat_member !is null ) data["chat_member"] = _chat_member.getAsJson();

        return data;
    }

    /** The update's unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you're using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially. */
    private ulong _update_id;
    /**
     * Getter for '_update_id'
     * Returns: Current value of '_update_id'
     */
    @property ulong updateId () { return _update_id; }
    /**
     * Setter for '_update_id'
     * Params: updateIdNew = New value of '_update_id'
     * Returns: New value of '_update_id'
     */
    @property ulong updateId ( ulong updateIdNew ) { return _update_id = updateIdNew; }

    /** <em>Optional</em>. New incoming message of any kind &#8212; text, photo, sticker, etc. */
    private TelegramMessage _message;
    /**
     * Getter for '_message'
     * Returns: Current value of '_message'
     */
    @property TelegramMessage message () { return _message; }
    /**
     * Setter for '_message'
     * Params: messageNew = New value of '_message'
     * Returns: New value of '_message'
     */
    @property TelegramMessage message ( TelegramMessage messageNew ) { return _message = messageNew; }

    /** <em>Optional</em>. New version of a message that is known to the bot and was edited */
    private TelegramMessage _edited_message;
    /**
     * Getter for '_edited_message'
     * Returns: Current value of '_edited_message'
     */
    @property TelegramMessage editedMessage () { return _edited_message; }
    /**
     * Setter for '_edited_message'
     * Params: editedMessageNew = New value of '_edited_message'
     * Returns: New value of '_edited_message'
     */
    @property TelegramMessage editedMessage ( TelegramMessage editedMessageNew ) { return _edited_message = editedMessageNew; }

    /** <em>Optional</em>. New incoming channel post of any kind &#8212; text, photo, sticker, etc. */
    private TelegramMessage _channel_post;
    /**
     * Getter for '_channel_post'
     * Returns: Current value of '_channel_post'
     */
    @property TelegramMessage channelPost () { return _channel_post; }
    /**
     * Setter for '_channel_post'
     * Params: channelPostNew = New value of '_channel_post'
     * Returns: New value of '_channel_post'
     */
    @property TelegramMessage channelPost ( TelegramMessage channelPostNew ) { return _channel_post = channelPostNew; }

    /** <em>Optional</em>. New version of a channel post that is known to the bot and was edited */
    private TelegramMessage _edited_channel_post;
    /**
     * Getter for '_edited_channel_post'
     * Returns: Current value of '_edited_channel_post'
     */
    @property TelegramMessage editedChannelPost () { return _edited_channel_post; }
    /**
     * Setter for '_edited_channel_post'
     * Params: editedChannelPostNew = New value of '_edited_channel_post'
     * Returns: New value of '_edited_channel_post'
     */
    @property TelegramMessage editedChannelPost ( TelegramMessage editedChannelPostNew ) { return _edited_channel_post = editedChannelPostNew; }

    /** <em>Optional</em>. New incoming inline query */
    private TelegramInlineQuery _inline_query;
    /**
     * Getter for '_inline_query'
     * Returns: Current value of '_inline_query'
     */
    @property TelegramInlineQuery inlineQuery () { return _inline_query; }
    /**
     * Setter for '_inline_query'
     * Params: inlineQueryNew = New value of '_inline_query'
     * Returns: New value of '_inline_query'
     */
    @property TelegramInlineQuery inlineQuery ( TelegramInlineQuery inlineQueryNew ) { return _inline_query = inlineQueryNew; }

    /** <em>Optional</em>. The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot. */
    private TelegramChosenInlineResult _chosen_inline_result;
    /**
     * Getter for '_chosen_inline_result'
     * Returns: Current value of '_chosen_inline_result'
     */
    @property TelegramChosenInlineResult chosenInlineResult () { return _chosen_inline_result; }
    /**
     * Setter for '_chosen_inline_result'
     * Params: chosenInlineResultNew = New value of '_chosen_inline_result'
     * Returns: New value of '_chosen_inline_result'
     */
    @property TelegramChosenInlineResult chosenInlineResult ( TelegramChosenInlineResult chosenInlineResultNew ) { return _chosen_inline_result = chosenInlineResultNew; }

    /** <em>Optional</em>. New incoming callback query */
    private TelegramCallbackQuery _callback_query;
    /**
     * Getter for '_callback_query'
     * Returns: Current value of '_callback_query'
     */
    @property TelegramCallbackQuery callbackQuery () { return _callback_query; }
    /**
     * Setter for '_callback_query'
     * Params: callbackQueryNew = New value of '_callback_query'
     * Returns: New value of '_callback_query'
     */
    @property TelegramCallbackQuery callbackQuery ( TelegramCallbackQuery callbackQueryNew ) { return _callback_query = callbackQueryNew; }

    /** <em>Optional</em>. New incoming shipping query. Only for invoices with flexible price */
    private TelegramShippingQuery _shipping_query;
    /**
     * Getter for '_shipping_query'
     * Returns: Current value of '_shipping_query'
     */
    @property TelegramShippingQuery shippingQuery () { return _shipping_query; }
    /**
     * Setter for '_shipping_query'
     * Params: shippingQueryNew = New value of '_shipping_query'
     * Returns: New value of '_shipping_query'
     */
    @property TelegramShippingQuery shippingQuery ( TelegramShippingQuery shippingQueryNew ) { return _shipping_query = shippingQueryNew; }

    /** <em>Optional</em>. New incoming pre-checkout query. Contains full information about checkout */
    private TelegramPreCheckoutQuery _pre_checkout_query;
    /**
     * Getter for '_pre_checkout_query'
     * Returns: Current value of '_pre_checkout_query'
     */
    @property TelegramPreCheckoutQuery preCheckoutQuery () { return _pre_checkout_query; }
    /**
     * Setter for '_pre_checkout_query'
     * Params: preCheckoutQueryNew = New value of '_pre_checkout_query'
     * Returns: New value of '_pre_checkout_query'
     */
    @property TelegramPreCheckoutQuery preCheckoutQuery ( TelegramPreCheckoutQuery preCheckoutQueryNew ) { return _pre_checkout_query = preCheckoutQueryNew; }

    /** <em>Optional</em>. New poll state. Bots receive only updates about stopped polls and polls, which are sent by the bot */
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

    /** <em>Optional</em>. A user changed their answer in a non-anonymous poll. Bots receive new votes only in polls that were sent by the bot itself. */
    private TelegramPollAnswer _poll_answer;
    /**
     * Getter for '_poll_answer'
     * Returns: Current value of '_poll_answer'
     */
    @property TelegramPollAnswer pollAnswer () { return _poll_answer; }
    /**
     * Setter for '_poll_answer'
     * Params: pollAnswerNew = New value of '_poll_answer'
     * Returns: New value of '_poll_answer'
     */
    @property TelegramPollAnswer pollAnswer ( TelegramPollAnswer pollAnswerNew ) { return _poll_answer = pollAnswerNew; }

    /** <em>Optional</em>. The bot's chat member status was updated in a chat. For private chats, this update is received only when the bot is blocked or unblocked by the user. */
    private TelegramChatMemberUpdated _my_chat_member;
    /**
     * Getter for '_my_chat_member'
     * Returns: Current value of '_my_chat_member'
     */
    @property TelegramChatMemberUpdated myChatMember () { return _my_chat_member; }
    /**
     * Setter for '_my_chat_member'
     * Params: myChatMemberNew = New value of '_my_chat_member'
     * Returns: New value of '_my_chat_member'
     */
    @property TelegramChatMemberUpdated myChatMember ( TelegramChatMemberUpdated myChatMemberNew ) { return _my_chat_member = myChatMemberNew; }

    /** <em>Optional</em>. A chat member's status was updated in a chat. The bot must be an administrator in the chat and must explicitly specify &#8220;chat_member&#8221; in the list of <em>allowed_updates</em> to receive these updates. */
    private TelegramChatMemberUpdated _chat_member;
    /**
     * Getter for '_chat_member'
     * Returns: Current value of '_chat_member'
     */
    @property TelegramChatMemberUpdated chatMember () { return _chat_member; }
    /**
     * Setter for '_chat_member'
     * Params: chatMemberNew = New value of '_chat_member'
     * Returns: New value of '_chat_member'
     */
    @property TelegramChatMemberUpdated chatMember ( TelegramChatMemberUpdated chatMemberNew ) { return _chat_member = chatMemberNew; }
}

