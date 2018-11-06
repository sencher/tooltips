/*
 * Copyright (c) 2013 Gamepoint. All Rights Reserved.
 * 
 * Woe to the traitor who tries to penetrate my secrets and to stretch forth a sacrilegious
 * hand toward my code. May all calamities and disgrace fall on him! May hunger twist his
 * entrails, and sleep flee from his bloodshot eyes! May the hand of the man wither who
 * hastens to him with rescue and pities him in his misery! May the bread on his table turn
 * into rottenness, and the wine into stinking juice! May his children die out, and his house
 * be filled with bastards who will spit on him and expel him! May he die groaning through many
 * days in loneliness, and may neither earth nor water receive his vile carcass, may no fire burn
 * it, no wild beasts devour it! And may his soul, torn by its sins, wander without rest,
 * through dark places.
 */
package legacy.math {
import flash.utils.Proxy;
import flash.utils.flash_proxy;

/**
 * 22.03.2013
 *
 * @author The following code was written by Amigo.
 *         Unless it doesn't work, then I have no idea who wrote it.
 */
public class Uints extends Proxy {

    ///////////////////////////////////////////////////////////////////////
    // Fields.

    private var _uints:Array;
    private var _start:int;
    private var _end:int;

    ///////////////////////////////////////////////////////////////////////
    // Constructor.

    function Uints(uints:Array = null, start:Number = NaN, end:Number = NaN) {
        _uints = (uints === null ? newUintArray(0) : uints);
        _start = (isNaN(start) ? 0 : start);
        _end = (isNaN(end) ? _uints.length : end);

        if (_end < _start)
            throw new BigNumberError("end must be >= start");
    }

    ///////////////////////////////////////////////////////////////////////
    // Properties.

    public function getAt(index:int):uint {
        index += _start;
        if (index < 0 || index >= _end || index >= _uints.length)
            return 0;
        return _uints[index];
    }

    public function setAt(value:uint, index:int):void {
        index += _start;
        if (index < 0 || index > _end || index > _uints.length)
            throw new BigNumberError("Index out of range: " + index);
        _uints[index] = value;
        if (index == _end)
            _end++;
    }

    public function get length():int {
        return (_end - _start);
    }

    public function set length(length:int):void {
        if (_start < 0 || _end > _uints.length)
            throw new BigNumberError("Cannot set length with start=" + _start + " and end=" + _end + " (normalize first)");

        _uints.length = _end = length + start;
    }

    public function get start():int {
        return _start;
    }

    public function set start(value:int):void {
        if (value > _end)
            throw new BigNumberError("start cannot be > end: " + _end);
        _start = value;
    }

    public function get end():int {
        return _end;
    }

    public function set end(value:int):void {
        if (value < _start)
            throw new BigNumberError("end cannot be < start: " + _start);
        _end = end;
    }

    public function isNormal():Boolean {
        return (
                _start == 0 &&
                        _end == _uints.length &&
                        (_end == 0 || _uints[_end - 1] != 0)
                );
    }

    ///////////////////////////////////////////////////////////////////////
    // Operations.

    public function normalize():void {

        if (isNormal())
            return;

        if (_start != 0 || _end != _uints.length) {
            // zero length uints or start/end out of significant range.
            if (_start >= _end || _end <= 0 || _start >= _uints.length)
                _uints = newUintArray(0);
            // start < 0 means: uints is the most significant part of the number,
            // followed by -start zeros ("45698987"..."000000" [-start * "0"]).
            else if (_start < 0)
                _uints = newUintArray(-_start).concat(_uints.slice(0, _end));
            else
                _uints = _uints.slice(_start, _end);

            _start = 0;
            _end = _uints.length;
        }

        // remove leading zeros (little endian order).
        while (_end > 0 && _uints[_end - 1] == 0)
            _end--;

        _uints.length = _end;
    }

    public function clone():Uints {
        return new Uints(_uints.concat(), _start, _end);
    }

    ///////////////////////////////////////////////////////////////////////
    // Proxy implementation (partial).

    override flash_proxy function getProperty(index:*):* {
        return getAt(index);
    }

    override flash_proxy function setProperty(index:*, value:*):void {
        setAt(value, index);
    }

    override flash_proxy function nextNameIndex(index:int):int {
        var i:int = index + _start;
        if (i < 0 || i >= _end)
            return 0;
        return index + 1;
    }

    override flash_proxy function nextValue(index:int):* {
        return getAt(index - 1);
    }

    override flash_proxy function callProperty(name:*, ...rest):* {
        throw new BigNumberError("Not implemented");
    }

    override flash_proxy function deleteProperty(name:*):Boolean {
        throw new BigNumberError("Not implemented");
    }

    override flash_proxy function hasProperty(name:*):Boolean {
        throw new BigNumberError("Not implemented");
    }

    override flash_proxy function isAttribute(name:*):Boolean {
        throw new BigNumberError("Not implemented");
    }

    override flash_proxy function nextName(index:int):String {
        throw new BigNumberError("Not implemented");
    }

    ///////////////////////////////////////////////////////////////////////
    // Static utility (initialized arrays).

    public static function newUintArray(length:int, def:uint = 0):Array {

        function init(e:*, i:int, a:Array):void {
            a[i] = def;
        }

        if (length <= 0)
            return new Array(0);

        var uints:Array = new Array(length);
        uints.forEach(init);
        return uints;
    }
}
}