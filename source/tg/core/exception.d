/**
 * Exception class fro telegram bots
 */
module tg.core.exception;

import std.exception;

/**
 * Exception class for tg
 */
class TelegramException : Exception {
    /**
     * Creantes and throw new exception
     * Params:
     *   msg = Error message for throw
     */
    public this (string msg) {
        super(msg);
    }
}
