package wowp.utils.array {


public class ArrayUtils {
    // returns new array where all elements will have pTestVar existing and true
    public static function filterByField(pArray:Array, pTestVar:String):Array {
        var test:Function = function (pItem:*, pI:int, pA:Array):Boolean {
            return pItem && pItem.hasOwnProperty(pTestVar) && Boolean(pItem[pTestVar]);
        };
        return pArray.filter(test, null);
    }
    
    
    public static function removeByString(value:Array, match:String):Array {
        var result:Array = [];
        for (var i:int; i < value.length; i++) {
            if (String(value[i]).indexOf(match) == -1) {
                result.push(value[i]);
            } else {
//                Cc.berrycw("CUT:", value[i]);
            }
        }
    
        return result;
    }
    
    public static function getProperty(iterable:Object, field:String):Array {
        var result:Array = [];
        for each(var obj:Object in iterable) {
            if (obj.hasOwnProperty(field)) {
                result.push(obj[field]);
            } else {
                result.push(null);
            }
        }
        return result;
    }
}
}
