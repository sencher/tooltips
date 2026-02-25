package wowp.utils {

import flash.utils.Dictionary;

public class DictionaryUtils {
    public function DictionaryUtils() {
    }
    
    public static function clone(original:Dictionary):Dictionary {
        var cloned:Dictionary = new Dictionary();
        for (var key:Object in original) {
            if (original[key] is Dictionary)
                cloned[key] = clone(original[key]);
            else
                cloned[key] = original[key];
        }
        return cloned;
    }
}
}
