/**
 * Contains TelegramInputFile
 */
module tg.types.telegram_input_file;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/** 
 * Supported file types for sending
 */
enum InputFileType {
    FileId, Url, LocalFile
}

/** 
 * This object represents the contents of a file to be uploaded.
 */
class TelegramInputFile : TelegramVariant {
    /** 
     * Inits TelegramInputFile
     * Params:
     *   data = JSON record with data
     *   t = Type of the file
     */
    private this (JSONValue data, InputFileType t) {
        super (data); fileType = t;
    }

    /** 
     * Create file from fileId (for sending)
     * Params:
     *   fileId = File If
     * Returns: TelegramInputFile with file`s id
     */
    public static TelegramInputFile createFromId (ulong fileId) {
        JSONValue data = parseJSON(""); data["id"] = fileId;

        TelegramInputFile result = new TelegramInputFile(data["id"], InputFileType.FileId);
        return result;
    }

    /** 
     * Creates file from URL
     * Params:
     *   url = URL to the file for sending
     * Returns: TelegramInput file created from URL
     */
    public static TelegramInputFile createFromUrl (string url) {
        JSONValue data = parseJSON(""); data["url"] = url;

        TelegramInputFile result = new TelegramInputFile(data["url"], InputFileType.Url);
        return result;
    }

    /** 
     * Creates object with local file 
     * Params:
     *   filePath = Path to the file for sending
     * Returns: TelegramInput file with local file
     */
    public static TelegramInputFile createFromFile (string filePath) {
        JSONValue data = parseJSON(""); data["file"] = filePath;

        TelegramInputFile result = new TelegramInputFile(data["file"], InputFileType.LocalFile);
        return result;
    }

    /** Type of the file for sewnding */
    private InputFileType fileType;
    /** 
     * getter for 'fileType'
     * Returns: Type of the file for sending
     */
    @property InputFileType type () { return fileType; }
}
