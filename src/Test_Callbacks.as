package {
import flash.display.Sprite;

public class Test_Callbacks extends Sprite {
    
    private var paramsNull:Object;
//    private var paramsNull:Object = {};
    
    public function Test_Callbacks() {
        var callback1:Function = func1;
        trace(callback1.length);
        callback1(1,2);
        callback1.call(null, 2,3);
        callback1.call(null, paramsNull, paramsNull);// null is ok
//        callback1.call(null);// Expected 2, got 0.
        callback1.apply(null, [3,4])

        var callbackRest:Function = funcRest;
        trace(callbackRest.length);
        callback1(1,2,3);
        callback1.call(null, 2,3,4);
        callback1.apply(null, [3,4,5])

        var callbackArray:Function = funcArray;
        trace(callbackArray.length);
        callbackArray([1,2,3]);
        callbackArray.call(null, [2,3,4]);
        callbackArray.call(null, paramsNull);// null is ok
        callbackArray.apply(null, [[3,4,5]]);
    
        var callbackSimple:Function = simpleFunc;
        trace(callbackSimple.length);
        callbackSimple();
        callbackSimple.call(null);
        callbackSimple.apply(null, []);
//        callbackSimple.call(null,111);// Error
    
        var callbackSimpleOptional:Function = simpleOptional;
        trace(callbackSimpleOptional.length);
        callbackSimpleOptional();
        callbackSimpleOptional.call(null,111);
    }

    private function func1(value1:*, value2:*):void{
        trace("func1", arguments);
    }
    
    private function funcRest(value1:*, value2:*, ...rest):void{
        trace("funcRest", value1, value2, rest);
    }

    private function funcArray(a:Array):void {
        trace("funcArray", arguments);
    }
    
    private function simpleFunc():void {
        trace("simpleFunc");
    }
    
    private function simpleOptional(dummy:* = null):void {
        trace("simpleOptional", dummy);
    }
}
}
