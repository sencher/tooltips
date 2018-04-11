package {
import com.adobe.utils.DateUtil;

import flash.display.Sprite;
import flash.events.UncaughtErrorEvent;

import utils.Utils;

public class Test_ForPerformance extends Sprite {
    private var dummy:int = 0;
    private var repeats:int = 200000000;

    public function Test_ForPerformance() {
        loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, uncaughtErrorHandler);
        //loaderInfo.loader.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, uncaughtErrorHandler);

        test1();
        test2();
        test2();
        test1();
        test1();
        test1();
        test2();
        test2();
        test1();

    }

    private function uncaughtErrorHandler(event:UncaughtErrorEvent):void {
        trace(event.error);
    }

    private function test1():void {
        try {
            dummy = 0;
            var initTime:Number = DateUtil.getTimeNow();

            for (var i:int = 0; i < repeats; i++) {
                //new Sprite();
                dummy *= dummy;
            }

            var time2:Number = DateUtil.getTimeNow();
            trace(initTime, time2);
            trace("inside", time2 - initTime);
        }catch (event:Error){
            trace(event.message);
        }
    }

    private function test2():void {
        try {
            dummy = 0;
            var initTime:Number = DateUtil.getTimeNow();

            var k:int;
            for (k = 0; k < repeats; k++){
                //new Sprite();
                dummy*=dummy;
            }

            var time2:Number = DateUtil.getTimeNow();
            trace(initTime, time2);
            trace("outside", time2 - initTime);
        }catch (event:Error){
            trace(event.message);
        }
    }
}
}
