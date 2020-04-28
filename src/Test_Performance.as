package {
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.getTimer;

public class Test_Performance extends Sprite {
    private const ITERATIONS:int = 5000000;
    private const MAX_REPEATS:int = 10;
    private const FRAMES_WAIT:int = 0;
    private var framesWaited:int = 0;
    private var repeats:int = 0;
    private var startTime:int;
    private var step1Time:int;
    private var step2Time:int;
    private var arr1:Array = [11, 22, 33, 44, 55, 66, 77, 88, 99];
    private var arr2:Array = [1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9];

    public function Test_Performance() {
        addEventListener(Event.ENTER_FRAME, stage_enterFrameHandler);
    }

    //first frame with calculations gives bullshit time anyway
    private function stage_enterFrameHandler(event:Event):void {
        if (framesWaited < FRAMES_WAIT) {
            framesWaited++;
            return;
        }

        repeats++;
        if (repeats >= MAX_REPEATS) {
            removeEventListener(Event.ENTER_FRAME, stage_enterFrameHandler);
        }

        startTime = getTimer();

        var sum1:Number = 0;
        for (var i:int = 0; i < ITERATIONS; i++) {
            sum1 += arr1[i % arr1.length];
        }
        step1Time = getTimer();

        var sum2:Number = 0;
        for (var j:int = 0; j < ITERATIONS; j++) {
            sum2 += arr2[j % arr2.length];
        }
        step2Time = getTimer();

        trace("Time1: " + (step1Time - startTime) * 0.001, sum1);
        trace("Time2: " + (step2Time - step1Time) * 0.001, sum2);
    }
}
}
