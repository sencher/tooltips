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
import flash.utils.Dictionary;

/**
 * 15.07.2009
 *
 * @author Amigo
 */
public class HashMap {
    private var map:Dictionary;
    private var _size:int;

    public function HashMap(size:int = 0) {
        map = new Dictionary();
    }

    public function put(key:*, value:*):void {
        if (map[key] == null) {
            _size++;
        }
        map[key] = value;
    }

    public function putAll(newMap:HashMap):void {
        for each (var key:* in newMap.keySet()) {
            put(key, newMap.get(key));
        }
    }

    public function get(key:*):* {
        return map[key];
    }

    public function getKeysFromValue(value:String):Array {
        var result:Array = [];
        var i:*;
        for each (i in keySet()) {
            if (get(i) == value) {
                result.push(i);
            }
        }
        return result;
    }

    public function remove(key:*):* {
        var value:* = map[key];
        if (value != null) {
            _size--;
        }
        delete map[key];
        return value;
    }

    public function size():int {
        return _size;
    }

    public function isEmpty():Boolean {
        return size() == 0;
    }

    public function containsKey(key:*):Boolean {
        return map[key] != null;
    }

    public function values():LinkedList {
        var values:LinkedList = new LinkedList();
        for each (var v:* in map) {
            values.add(v);
        }
        return values;
    }

    public function keySet():LinkedList {
        var values:LinkedList = new LinkedList();
        for (var v:* in map) {
            values.add(v);
        }
        return values;
    }

    public function clear():void {
        map = new Dictionary();
        _size = 0;
    }

    public function clone():HashMap {
        var newMap:HashMap = new HashMap(_size);
        newMap.putAll(this);
        return newMap;
    }
}
}