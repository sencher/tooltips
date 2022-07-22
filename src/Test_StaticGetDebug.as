package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;

import utils.Utils;

public class Test_StaticGetDebug extends Sprite {
    
//    public static const ARRAY:Array = [1,7,12];
    private static const _ARRAY:Array = [1,7,12];
    
    public function Test_StaticGetDebug() {
        Utils.addConsole(stage);
        
        trace("before");
        
        ARRAY.push(4);
        
        trace(ARRAY.length)
        
        trace(ARRAY[2]);
    }
    
    public static function get ARRAY():Array{
        Cc.logcw("ARRAY", "access to ARRAY");
        return _ARRAY;
    }
}
}
