/**
 * Definitions of parent type class and some mixins
 */
module tg.core.type;

import std.json : JSONValue, parseJSON;

/**
 * Override getAsJSON for nullptr_t type
 */
JSONValue getAsJson (typeof(null)) { return parseJSON(""); }

/** 
 * Parent class for TelegramTypes
 */
abstract class TelegramType {
    /**
     * Set param's data from server's response
     * Throws: TelegramException if cannot find important entry
     * Params:
     *   data = JSON data for reading
     */
    public void setFromJson (JSONValue data);

    /**
     * Return type's data as JSON record
     * Throws: TelegramException if some params were not setted
     * Returns: JSON record with type's data
     */
    public JSONValue getAsJson ();
}

/**
 * Mixin for template with fast init from server`s response
 */
immutable string TelegramTypeConstructor = "" ~
    "/** \n" ~
    "* Create new Type and read data from JSON \n" ~ 
    "* Params:\n" ~
    "*   data = JSON record with type's data\n" ~ 
    "*/\n" ~
    "public this (JSONValue data) {\n" ~
    "    this(); setFromJson (data);\n" ~
    "}" ~ '\n';

/** 
 * Universal telegram type
 */
class TelegramVariant : TelegramType {
    /** Type`s data */
    private JSONValue _data;

    /** 
     * Default constructor. Creates and inits data
     */
    public this () { _data = parseJSON(""); }

    /** Add Constructor with fast init */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) { _data = data; }

    override public JSONValue getAsJson () { return _data; }
}
