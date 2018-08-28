package {
import flash.display.Sprite;

public class Test_InitTypes extends Sprite {
    public function Test_InitTypes() {
        var b:Boolean;
        var i:int;
        var n:Number;
        var s:String;
        var a:Array;
        var o:Object;
        trace(b, i, n, s, a, o);

        var boolean3:int = -1;
        if (boolean3 > 0) {
            trace("uninited true");
        }
        boolean3++;
        if (boolean3 > 0) {
            trace("0 true");
        }
        boolean3++;
        if (boolean3 > 0) {
            trace(">0 true");
        }

        boolean3 = int(false);
        trace("false : " + boolean3);

        boolean3 = int(true);
        trace("true : " + boolean3);

    }
}
}
