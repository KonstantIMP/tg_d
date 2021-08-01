/**
 * Full pack of Telegram types
 */
module tg.type;

public import tg.core.type;

public import tg.update.types.telegram_update;
public import tg.update.types.telegram_webhook_info;

public import tg.sticker.types.telegram_sticker;
public import tg.sticker.types.telegram_sticker_set;
public import tg.sticker.types.telegram_mask_position;

public import tg.passport.types.telegram_passport_data;
public import tg.passport.types.telegram_passport_file;
public import tg.passport.types.telegram_encrypted_passport_element;
public import tg.passport.types.telegram_encrypted_credentials;
public import tg.passport.types.telegram_passport_element_error_data_field;
public import tg.passport.types.telegram_passport_element_error_front_side;
public import tg.passport.types.telegram_passport_element_error_reverse_side;
public import tg.passport.types.telegram_passport_element_error_selfie;
public import tg.passport.types.telegram_passport_element_error_file;
public import tg.passport.types.telegram_passport_element_error_files;
public import tg.passport.types.telegram_passport_element_error_translation_file;
public import tg.passport.types.telegram_passport_element_error_translation_files;
public import tg.passport.types.telegram_passport_element_error_unspecified;

public import tg.types.telegram_user;
public import tg.types.telegram_chat;
public import tg.types.telegram_message;
public import tg.types.telegram_message_id;
public import tg.types.telegram_message_entity;
public import tg.types.telegram_photo_size;
public import tg.types.telegram_animation;
public import tg.types.telegram_audio;
public import tg.types.telegram_document;
public import tg.types.telegram_video;
public import tg.types.telegram_video_note;
public import tg.types.telegram_voice;
public import tg.types.telegram_contact;
public import tg.types.telegram_dice;
public import tg.types.telegram_poll_option;
public import tg.types.telegram_poll_answer;
public import tg.types.telegram_poll;
public import tg.types.telegram_location;
public import tg.types.telegram_venue;
public import tg.types.telegram_proximity_alert_triggered;
public import tg.types.telegram_message_auto_delete_timer_changed;
public import tg.types.telegram_voice_chat_scheduled;
public import tg.types.telegram_voice_chat_ended;
public import tg.types.telegram_voice_chat_participants_invited;
public import tg.types.telegram_user_profile_photos;
public import tg.types.telegram_reply_keyboard_markup;
public import tg.types.telegram_keyboard_button;
public import tg.types.telegram_keyboard_button_poll_type;
public import tg.types.telegram_reply_keyboard_remove;
public import tg.types.telegram_inline_keyboard_markup;
public import tg.types.telegram_inline_keyboard_button;
public import tg.types.telegram_callback_query;
public import tg.types.telegram_force_reply;
public import tg.types.telegram_chat_photo;
public import tg.types.telegram_chat_invite_link;
public import tg.types.telegram_chat_member_owner;
public import tg.types.telegram_chat_member_administrator;
public import tg.types.telegram_chat_member_member;
public import tg.types.telegram_chat_member_restricted;
public import tg.types.telegram_chat_member_left;
public import tg.types.telegram_chat_member_banned;
public import tg.types.telegram_chat_member_updated;
public import tg.types.telegram_chat_permissions;
public import tg.types.telegram_chat_location;
public import tg.types.telegram_bot_command;
public import tg.types.telegram_bot_command_scope_default;
public import tg.types.telegram_bot_command_scope_all_private_chats;
public import tg.types.telegram_bot_command_scope_all_group_chats;
public import tg.types.telegram_bot_command_scope_all_chat_administrators;
public import tg.types.telegram_bot_command_scope_chat;
public import tg.types.telegram_bot_command_scope_chat_administrators;
public import tg.types.telegram_bot_command_scope_chat_member;
public import tg.types.telegram_response_parameters;
public import tg.types.telegram_input_media_photo;
public import tg.types.telegram_input_media_video;
public import tg.types.telegram_input_media_animation;
public import tg.types.telegram_input_media_audio;
public import tg.types.telegram_input_media_document;
public import tg.types.telegram_voice_chat_started;
public import tg.types.telegram_login_url;

public import tg.payment.types.telegram_labeled_price;
public import tg.payment.types.telegram_invoice;
public import tg.payment.types.telegram_shipping_address;
public import tg.payment.types.telegram_order_info;
public import tg.payment.types.telegram_shipping_option;
public import tg.payment.types.telegram_successful_payment;
public import tg.payment.types.telegram_shipping_query;
public import tg.payment.types.telegram_pre_checkout_query;

public import tg.inline.types.telegram_inline_query;
public import tg.inline.types.telegram_inline_query_result_article;
public import tg.inline.types.telegram_inline_query_result_photo;
public import tg.inline.types.telegram_inline_query_result_gif;
public import tg.inline.types.telegram_inline_query_result_mpeg_4_gif;
public import tg.inline.types.telegram_inline_query_result_audio;
public import tg.inline.types.telegram_inline_query_result_voice;
public import tg.inline.types.telegram_inline_query_result_document;
public import tg.inline.types.telegram_inline_query_result_location;
public import tg.inline.types.telegram_inline_query_result_venue;
public import tg.inline.types.telegram_inline_query_result_contact;
public import tg.inline.types.telegram_inline_query_result_game;
public import tg.inline.types.telegram_inline_query_result_cached_photo;
public import tg.inline.types.telegram_inline_query_result_cached_gif;
public import tg.inline.types.telegram_inline_query_result_cached_mpeg_4_gif;
public import tg.inline.types.telegram_inline_query_result_cached_sticker;
public import tg.inline.types.telegram_inline_query_result_cached_document;
public import tg.inline.types.telegram_inline_query_result_cached_video;
public import tg.inline.types.telegram_inline_query_result_cached_voice;
public import tg.inline.types.telegram_inline_query_result_cached_audio;
public import tg.inline.types.telegram_input_text_message_content;
public import tg.inline.types.telegram_input_location_message_content;
public import tg.inline.types.telegram_input_venue_message_content;
public import tg.inline.types.telegram_input_contact_message_content;
public import tg.inline.types.telegram_input_invoice_message_content;
public import tg.inline.types.telegram_chosen_inline_result;

public import tg.game.types.telegram_game;
public import tg.game.types.telegram_game_high_score;
public import tg.game.types.telegram_callback_game;

alias TelegramChatMember = TelegramVariant;
alias TelegramInputMessageContent = TelegramVariant;
alias TelegramInputFile = TelegramVariant;

