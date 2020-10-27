package {
import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.utils.getTimer;
import flash.utils.setTimeout;

import utils.Utils;

public class Test_Pause extends Sprite {
    private var startTime:Number = getTimer();
    
    public function Test_Pause() {
        trace(1, getTimeFromStart());
        //bugged if smaller than Utils.delayCode
        delayedFunctionCall(400,function (){trace(21, getTimeFromStart());});
        Utils.delayCode(800);
        trace(3, getTimeFromStart());
        setTimeout(function (){trace(31, getTimeFromStart());},8000);
        Utils.delayCode(600);
        trace(4, getTimeFromStart());
        Utils.delayCode(1000);
        trace(5, getTimeFromStart());
    }
    
    private function delayedFunctionCall(delay:int, callback:Function) {
        trace('going to execute the function you passed me in', delay, 'milliseconds');
        var timer:Timer = new Timer(delay, 1);
        var callbackWithRemoveListener:Function = function ():void {
            timer.removeEventListener(TimerEvent.TIMER, callbackWithRemoveListener);
            callback();
        }
        timer.addEventListener(TimerEvent.TIMER, callbackWithRemoveListener);
        timer.start();
    }
    
    private function getTimeFromStart():Number {
        return getTimer() - startTime;
    }
}
}
