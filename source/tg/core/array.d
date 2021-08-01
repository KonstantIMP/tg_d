/**
 * Functions to convert JSON array's to Telegram and reverse
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: 1 Aug 2021
 */
module tg.core.array;

/** Import needed libs */
import std.json, tg.core.type, tg.type;
import std.traits : isArray;
import std.conv : to;

/** 
 * Convert JSON array to array from TelegramType
 * Params:
 *   source = JSON array to convert
 * Returns: Array of T
 */
T [] toTelegram (T) (JSONValue source) {
    T [] result = new T[0];

    foreach (t; source.array) {
        result.length += 1; result[$ - 1] = new T(t);
    }

    return result;
}

/** 
 * Convert JSON array to array of array from TelegramType
 * Params:
 *   source = JSON array of array to convert
 * Returns: Array of array of T
 */
T [][] toTelegramMatrix (T) (JSONValue source) {
    T [][] result = new T[][0];

    foreach (t1; source.array) {
        result.length += 1; result[$ - 1] = new T[0];
        foreach (t2; t1.array) {
            result[$ - 1].length += 1; result[$ - 1][$ - 1] = new T(t2);
        }
    }

    return result;
}

/** 
 * Convert JSON array to array from base types
 * Params:
 *   source = JSON array to convert
 * Returns: Array of T
 */
T [] toBase (T) (JSONValue source) {
    T [] result = new T[0];

    foreach (t; source.array) {
        result.length += 1; result[$ - 1] = to!T(t.str());
    }

    return result;
}

/** 
 * Convert JSON array to array of array from Base types
 * Params:
 *   source = JSON array to convert
 * Returns: Array of T
 */
T [][] toBaseMatrix (T) (JSONValue source) {
    T [][] result = new T[0][0];

    foreach (t1; source.array) {
        result.length += 1; result[$ - 1] = new T[0];
        foreach (t2; t1.array) {
            result[$ - 1].length += 1; result[$ - 1][$ - 1] = to!T(t2.str());
        }
    }

    return result;
}

/** 
 * Convert array to JSON
 * Params:
 *   telegramType = Array from telegram types for convert
 * Returns: JSON record with the array
 */
JSONValue getAsJson (T) (T [] telegramType) if ((isArray!T == false)) {
    JSONValue result = parseJSON("[]");

    foreach (t; telegramType) {
        result.array ~= t.getAsJson();
    }

    return result;
}

/** 
 * Convert array of array to JSON
 * Params:
 *   telegramType = Array of array from telegram types for convert
 * Returns: JSON record with the array of array
 */
JSONValue getAsJson (T) (T [][] telegramType) {
    JSONValue result = parseJSON("[]");

    foreach (t1; telegramType) {
        JSONValue tmpResult = parseJSON("[]");
        foreach (t2; t1) {
            tmpResult.array ~= t2.getAsJson();
        }
        result.array ~= tmpResult;
    }

    return result;
}

