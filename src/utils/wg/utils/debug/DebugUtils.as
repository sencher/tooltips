package utils.wg.utils.debug {
import flash.utils.getTimer;

public class DebugUtils {
    public static function delayCode(ms:Number):void{
        var delayStart:Number = getTimer();
        while (getTimer() - delayStart < ms){
        }
    }
}
}
