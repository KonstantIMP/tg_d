/**
 * Contains TelegramMaskPosition
 */
module tg.sticker.types.telegram_mask_position;

import tg.core.type, tg.core.exception;
import std.json, tg.type;

/**
 * This object describes the position on faces where a mask should be placed by default.
 */
class TelegramMaskPosition : TelegramType {
    /**
     * Creates new type object
     */
    nothrow pure public this () @safe {
        _point = "";
        _x_shift = double.nan;
        _y_shift = double.nan;
        _scale = double.nan;
    }

    /** Add constructor with data init from response */
    mixin(TelegramTypeConstructor);

    override public void setFromJson (JSONValue data) {
        if ( "point" !in data ) throw new TelegramException("Could not find reqired entry : point");
        _point = data["point"].str();

        if ( "x_shift" !in data ) throw new TelegramException("Could not find reqired entry : x_shift");
        _x_shift = data["x_shift"].floating();

        if ( "y_shift" !in data ) throw new TelegramException("Could not find reqired entry : y_shift");
        _y_shift = data["y_shift"].floating();

        if ( "scale" !in data ) throw new TelegramException("Could not find reqired entry : scale");
        _scale = data["scale"].floating();
    }

    override public JSONValue getAsJson () {
        JSONValue data = parseJSON("");

        data["point"] = _point;

        data["x_shift"] = _x_shift;

        data["y_shift"] = _y_shift;

        data["scale"] = _scale;

        return data;
    }

    /** The part of the face relative to which the mask should be placed. One of &#8220;forehead&#8221;, &#8220;eyes&#8221;, &#8220;mouth&#8221;, or &#8220;chin&#8221;. */
    private string _point;
    /**
     * Getter for '_point'
     * Returns: Current value of '_point'
     */
    @property string point () { return _point; }
    /**
     * Setter for '_point'
     * Params: pointNew = New value of '_point'
     * Returns: New value of '_point'
     */
    @property string point ( string pointNew ) { return _point = pointNew; }

    /** Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position. */
    private double _x_shift;
    /**
     * Getter for '_x_shift'
     * Returns: Current value of '_x_shift'
     */
    @property double xShift () { return _x_shift; }
    /**
     * Setter for '_x_shift'
     * Params: xShiftNew = New value of '_x_shift'
     * Returns: New value of '_x_shift'
     */
    @property double xShift ( double xShiftNew ) { return _x_shift = xShiftNew; }

    /** Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position. */
    private double _y_shift;
    /**
     * Getter for '_y_shift'
     * Returns: Current value of '_y_shift'
     */
    @property double yShift () { return _y_shift; }
    /**
     * Setter for '_y_shift'
     * Params: yShiftNew = New value of '_y_shift'
     * Returns: New value of '_y_shift'
     */
    @property double yShift ( double yShiftNew ) { return _y_shift = yShiftNew; }

    /** Mask scaling coefficient. For example, 2.0 means double size. */
    private double _scale;
    /**
     * Getter for '_scale'
     * Returns: Current value of '_scale'
     */
    @property double scale () { return _scale; }
    /**
     * Setter for '_scale'
     * Params: scaleNew = New value of '_scale'
     * Returns: New value of '_scale'
     */
    @property double scale ( double scaleNew ) { return _scale = scaleNew; }
}

