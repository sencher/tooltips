package {
import flash.display.Sprite;

public class Test_Callbacks extends Sprite {
    public function Test_Callbacks() {
        var callback1:Function = func1;
        callback1(1,2,3);
        callback1.call(null, 2,3,4);
        callback1.apply(null, [3,4,5])


        var callback2:Function = funcArray;
        callback2([1,2,3]);
        callback2.call(null, [2,3,4]);
        callback2.apply(null, [[3,4,5]]);
    }

    private function func1(value1:*, value2:*):void{
        trace("func1", arguments);
    }

    private function funcArray(a:Array):void {
        trace("funcArray", arguments);
    }
}
}
