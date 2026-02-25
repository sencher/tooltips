package wowp.utils.object {

import com.junkbyte.console.Cc;

import mx.utils.ObjectUtil;

public class ObjectUtils {
    private static const EXTENSION:RegExp = /(.*)\.(.*)/;
    
    public function ObjectUtils() {
    }
    
    public static function copyAndSortByExtension(value:Object):Object {
//        Cc.magentacw("ObjectUtils", "copyAndSortByExtension", value, "Cc.D_ONCE:", Cc.D_ONCE);
        var extension:String;
        var result:Object = {};
        var copy:Object = ObjectUtil.copy(value);
        for (var key:* in copy) {
            extension = key.split(".")[1];
            if (extension) {
//                if (Cc.D_ONCE) Cc.magenta("extension:", extension);
                if (!result[extension]) {
                    result[extension] = {};
//                    if (Cc.D_ONCE) Cc.magenta("result[extension]:", result[extension]);
                }
//                if (Cc.D_ONCE) {
//                    Cc.magenta("result[extension][key]:", result[extension][key], "copy[key]:", copy[key]);
//                    Cc.D_ONCE = false;
//                }
                result[extension][key] = copy[key];
            }
        }
        
        return result;
    }
    
    public static function sortByExtension(value:Object):Object {
        var extension:String;
        var result:Object = {};
        for (var key:* in value) {
            extension = key.split(".")[1];
            if (extension) {
                if (!result[extension]) {
                    result[extension] = {};
                }
                result[extension][key] = value[key];
            }
        }
        
        return result;
    }
}
}
