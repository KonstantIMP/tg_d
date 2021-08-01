/**
 * Functions to convert JSON array's to Telegram and reverse
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: 1 Aug 2021
 */
module tg.core.array;

import std.json, std.conv, tg.core.type, tg.type;

import std.traits;

T [] toTelegram (T) (JSONValue source) {
    T [] result = new T[0];

    foreach (t; source.array) {
        result.length += 1; result[$ - 1] = new T(t);
    }

    return result;
}

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

T [] toBase (T) (JSONValue source) {
    T [] result = new T[0];

    foreach (t; source.array) {
        result.length += 1; result[$ - 1] = to!T(t.str());
    }

    return result;
}

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

JSONValue getAsJson (T) (T [] telegramType) if ((isArray!T == false)) {
    JSONValue result = parseJSON("[]");

    foreach (t; telegramType) {
        result.array ~= t.getAsJson();
    }

    return result;
}

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
