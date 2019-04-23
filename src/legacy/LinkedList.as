/*
 * Copyright (c) 2009-2012 Gamepoint. All Rights Reserved.
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
package legacy {
import flash.utils.Proxy;
import flash.utils.flash_proxy;

use namespace flash_proxy;

/**
 * 15.07.2009
 *
 * @author Amigo
 */
public class LinkedList extends Proxy {
    private var _list:Array;

    public function LinkedList(c:LinkedList = null) {
        _list = new Array();
        addAll(c);
    }

    public function filter(callback:Function, thisObject:* = null):LinkedList {
        var l:LinkedList = new LinkedList();
        l._list = _list.filter(callback, thisObject);
        return l;
    }

    public function getFirst():* {
        return _list[0];
    }

    public function getLast():* {
        return _list[_list.length - 1];
    }

    public function add(item:*):void {
        _list.push(item);
    }

    public function addLast(item:*):void {
        add(item);
    }

    public function addFirst(item:*):void {
        _list.unshift(item);
    }

    public function addAt(index:int, item:*):void {
        _list.splice(index, 0, item);
    }

    public function isEmpty():Boolean {
        return _list.length == 0;
    }

    public function removeFirst():* {
        return _list.shift();
    }

    public function removeLast():* {
        return _list.pop();
    }

    public function size():int {
        return _list.length;
    }

    public function get(index:int):* {
        return _list[index];
    }

    public function clear():void {
        _list = new Array();
    }

    public function contains(value:*):Boolean {
        for (var i:int = 0; i < _list.length; i++) {
            if (_list[i] == value) {
                return true;
            }
        }
        return false;
    }

    public function indexOf(value:*):int {
        for (var i:int = 0; i < _list.length; i++) {
            if (_list[i] == value) {
                return i;
            }
        }
        return -1;
    }

    public function remove(value:*):void {
        var index:int = indexOf(value);
        if (index == 0) {
            _list.shift();
        } else if (index == (_list.length - 1)) {
            _list.pop();
        } else if (index > 0 && index < (_list.length - 1)) {
            _list.splice(index, 1);
        }
    }

    public function toArray():Array {
        return _list;
    }

    public function toString():String {
        var r:String = '[';
        for (var i:uint = 0; i < _list.length; i++) {
            r += _list[i];
            if (i < _list.length - 1) r += ', ';
        }
        r += ']';
        return r;
    }

    public function addAll(c:LinkedList):void {
        if (c != null) {
            this._list = _list.concat(c._list);
        }
    }

    override flash_proxy function nextNameIndex(index:int):int {
        if (index < _list.length) {
            return index + 1;
        } else {
            return 0;
        }
    }

    override flash_proxy function nextName(index:int):String {
        return _list[index - 1];
    }

    override flash_proxy function nextValue(index:int):* {
        return _list[index - 1];
    }

    override flash_proxy function getProperty(name:*):* {
        return _list[name];
    }

    /**
     * Sort list values as Strings, use Array.sort() method
     */
    public function sort(compareFunction:Function = null, sortOptions:Object = null):void {
        if (compareFunction != null && sortOptions != null) {
            _list.sort(compareFunction, sortOptions);
        }
        else {
            _list.sort();
        }
    }
}
}