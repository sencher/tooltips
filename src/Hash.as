package {
import flash.utils.Dictionary;

public dynamic class Hash extends Dictionary {
    public function Hash(weakKeys:Boolean = false) {
        super(weakKeys);
    }

    public function get length():uint {
        var counter:uint = 0;
        for (var key:* in this) {
            counter++;
        }
        return counter;
    }

    public function getKeys():Array {
        var keys:Array = new Array();
        for (var key:Object in this) {
            keys.push(key);
        }
        return keys;
    }

    public function getValues():Array {
        var values:Array = new Array();
        for (var key:Object in this) {
            values.push(this[key]);
        }
        return values;
    }

    public function hasKey(key:Object):Boolean {
        return getKey(key) != null;
    }

    public function getKey(key:Object):Object {
        return this[key];
    }

    public function setKey(key:Object, value:Object):void {
        this[key] = value;
    }

    public function setKeyIfEmpty(key:Object, value:Object):void {
        if (!hasKey(key)) {
            setKey(key, value);
        }
    }

    public function removeKey(key:Object):Boolean {
        try {
            delete this[key];
        }
        catch (e:Error) {
            return false;
        }
        return true;
    }

    public function getOrSet(key:Object, value:Object):Object {
        if (!hasKey(key)) {
            setKey(key, value);
        }
        return getKey(key);
    }

    public function filterKeys(filter_function:Function):Array {
        var result:Array = [];
        var index:uint = 0;
        var value:*;
        for (var key:* in this) {
            value = this[key];
            if (filter_function(key, value, this, index)) {
                result.push(key);
            }
            index++;
        }
        return result;
    }

    public function filterKeysByKey(filter_function:Function):Array {
        var result:Array = [];
        for (var key:* in this) {
            if (filter_function(key)) {
                result.push(key);
            }
        }
        return result;
    }

    public function filterValues(filter_function:Function):Array {
        var result:Array = [];
        var index:uint = 0;
        var value:*;
        for (var key:* in this) {
            value = this[key];
            if (filter_function(key, value, this, index)) {
                result.push(value);
            }
            index++;
        }
        return result;
    }

    public function some(some_function:Function):Boolean {
        var index:uint = 0;
        for (var key:* in this) {
            if (some_function(key, this[key], this, index)) {
                return true;
            }
            index++;
        }
        return false;
    }

    public static function from_object(object:Object):Hash {
        if (object == null) return new Hash();

        var hash:Hash = new Hash();
        for (var key:String in object) {
            hash.setKey(key, object[key]);
        }
        return hash;
    }

    public function get is_empty():Boolean {
        for (var key:* in this) { return false; }
        return true;
    }

    public function map(map_function:Function):Array {
        var result:Array = [];
        var index:uint = 0;
        var value:*;
        var mapped:*;
        for (var key:* in this) {
            value = this[key];
            mapped = map_function(key, value, this, index);
            result.push(mapped);
            index++;
        }
        return result;
    }


}
}
