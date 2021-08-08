/**
 * Module with execute bot methods and api imports
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: 1 Aug 2021
 */
module tg.bot;

/** Import used classes */
import tg.core.exception, tg.core.type, tg.core.array, tg.core.format;
import tg.type, tg.core.api, tg.passport.api, tg.sticker.api;
import tg.update.api;

/** Import requests */
import requests, std.conv : to;
import std.stdio : File;

/** Import JSON lib */
import std.json;

/** 
 * Implements Bot`s api methods
 */
class TelegramBot {
    /** 
     * Creates and init bot object
     * Params:
     *   botAPI = API key for getting access
     *   addr = Address of the telegram`s bot server
     */
    public this (string botAPI, string addr = "https://api.telegram.org") {
        botApi = botAPI; botAddr = addr; botRq = Request ();
        me = getMe();
    }

    /** 
     * Execute method of the API
     * Params:
     *   method = Method to be executed
     *   request = Data for sending to the server
     * Returns: JSON record with server`s response
     * Throws: TelegramException if the server returns an error
     */
    public JSONValue execute (string method, JSONValue request = parseJSON("")) {
        string methodUrl = botAddr ~ "/bot" ~ botApi ~ '/' ~ method;
        JSONValue response = parseJSON(to!string(botRq.post(methodUrl, request.toString(), "application/json").responseBody()));
        
        if ("ok" !in response) throw new TelegramException ("Incorrect server`s response : can not find \'ok\' and \'result\' entries");
        if (response["ok"].boolean == false) throw new TelegramException ("Request error : " ~ response["description"].str());

        return response["result"];
    }

    /** 
     * Execute method of the API as multipart/form-data (for file sending)
     * Params:
     *   method = Method to be executed
     *   request = Data for sending to the server
     * Returns: JSON record with server`s response
     * Throws: TelegramException if the server returns an error
     */
    public JSONValue execute (string method, MultipartForm request) {
        string methodUrl = botAddr ~ "/bot" ~ botApi ~ '/' ~ method;
        JSONValue response = parseJSON(to!string(botRq.post(methodUrl, request).responseBody()));
        
        if ("ok" !in response) throw new TelegramException ("Incorrect server`s response : can not find \'ok\' and \'result\' entries");
        if (response["ok"].boolean == false) throw new TelegramException ("Request error : " ~ response["description"].str());

        return response["result"];
    }

    /** Import API */
    mixin CoreBotApi;
    mixin UpdateBotApi;
    mixin StickerBotApi;
    mixin PassportBotApi;

    /** 
     * Execute method of the API
     * Params:
     *   method = Method to be executed
     *   request = Data for sending to the server
     * Returns: Specific telegram type with server`s response
     * Throws: TelegramException if the server returns an error or could not vonert to T
     */
    public T execute (T) (string method, JSONValue request = parseJSON("")) {
        return new T(execute(method, request));
    }

    /** 
     * Execute method of the API as multipart/form-data (for file sending)
     * Params:
     *   method = Method to be executed
     *   request = Data for sending to the server
     * Returns: Specific telegram type with server`s response
     * Throws: TelegramException if the server returns an error or could not vonert to T
     */
    public T execute (T) (string method, MultipartForm request) {
        return new T(execute(method, request));
    }

    /** 
     * Unique bot`s api key for getting access
     */
    private string botApi;
    /** 
     * Returns unique bot`s api key
     * Returns: Unique bot`s api key 
     */
    @property string api () { return botApi; }
    /** 
     * Address of the Telegram`s server
     */
    private string botAddr;
    /** 
     * Returns Address of the Telegram`s server
     * Returns: Address of the Telegram`s server
     */
    @property string address () { return botAddr; }

    /** 
     * Object for request executing
     */
    private Request botRq;

    /** This bot */
    private TelegramUser me;
    /** 
     * Getter for current bot (as TelegramUser)
     * Returns: Current bot
     */
    @property TelegramUser bot () { return me; }
}
