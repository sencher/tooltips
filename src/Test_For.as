package {

import flash.display.Sprite;
import flash.utils.getTimer;

public class Test_For extends Sprite {
    public function Test_For() {
        var size:Number = 1000000;
        var arr:Array = [];
        var time:Number, o:Object, i:int;
        
        for (i = 0; i < size; i++) arr[i] = i + 75;
    
        time = getTimer();
        for (i = 0; i < arr.length; i++) {
            arr[i];
//            trace(arr[i]);
        }
        trace("for test: " + (getTimer() - time) + "ms");

        time = getTimer();
        for (i = arr.length - 1; i > -1; i--) {
            arr[i];
//            trace(arr[i]);
        }
        trace("for reversed test: " + (getTimer() - time) + "ms");

        time = getTimer();
        for (i in arr) {
            arr[i];
//            trace(arr[i]);
        }
        trace("for in test: " + (getTimer() - time) + "ms");
        
        time = getTimer();
        for each(o in arr) {
            o;
//            trace(o);
        }
        trace("for each in test: " + (getTimer() - time) + "ms");
        
        // Result
//        for test: 212ms
//        for reversed test: 26ms
//        for each test: 103ms
    }
}
}
