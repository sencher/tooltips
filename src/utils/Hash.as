package utils {
    import flash.utils.Dictionary;

    public dynamic class Hash extends Dictionary {
    public function Hash(weakKeys:Boolean = false) {
        super(weakKeys);
    }

    public function get length():uint {
        return getKeys().length
    }

    public function getKeys():Array {
        var keys:Array = new Array();
        for (var key:Object in this) {
            keys.push(key);
        }
        return keys;
    }

    public function clear():void {
        var keys:Array = getKeys();
        var i:int, l:int = keys.length;

        for (i = 0; i < l; i++) {
            removeKey(keys[i]);
        }
    }

    public function getValues():Array {
        var values:Array = new Array();
        for (var key:Object in this) {
            values.push(getKey(key));
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

    public static function from_object(object:Object):Hash {
        var hash:Hash = new Hash();
        for (var key:String in object) {
            hash.setKey(key, object[key]);
        }
        return hash;
    }

    public static function fromArray(a:Array):Hash {
        var hash:Hash = new Hash(), i:int;
        for (i = 0; i < a.length; i++) hash[i] = a[i];
        return hash;
    }
}
}
