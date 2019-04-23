package {
import flash.display.Sprite;

public class Test_ParanoicPattern extends Sprite {
    private static const AWAITING_COLLECT:int = 4;
    private var _collected:Array;

    public function Test_ParanoicPattern() {
       _collected = new Array(AWAITING_COLLECT);
        //trace(_collected)
        data1({someShit:5});
        data2({someShit:5});
        data2({someShit:5});
        data1({someShit:5});
        data2({someShit:5});
        data3({someShit:5});
        data0({someShit:5});
        data3({someShit:5});
    }

    private function data0(value:*):void {
        _collected[0] = value;
        tryFinalJob()
    }

    private function data1(value:*):void {
        _collected[1] = value;
        tryFinalJob()
    }

    private function data2(value:*):void {
        _collected[2] = value;
        tryFinalJob()
    }

    private function data3(value:*):void {
        _collected[3] = value;
        tryFinalJob()
    }

    private function tryFinalJob():void {
        trace("tryFinalJob", _collected);
        if(allCollected()){
            finalJob();
        }
    }

    private function finalJob():void {
        trace("finalJob");
    }

    private function allCollected():Boolean{
        var i:*;
        for  (i = 0; i< AWAITING_COLLECT; i++){
            if(!_collected[i]){
                return false;
            }
        }
        return true;
    }
}
}
