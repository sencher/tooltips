package {
import flash.display.Sprite;

import utils.Utils;

public class Test_Vector2d extends Sprite {
    public function Test_Vector2d() {
        var v:Vector.<Vector.<int>> = new Vector.<Vector.<int>>();
        v.push(new Vector.<int>());
        v.push(new Vector.<int>());

        v[0].push(0);
        v[0].push(1);
        v[0].push(2);
        v[0][3] = 3;
        v[0][4] = 4;
        v[0][1] = 11;
//        v[0][7] = 7;//error

        v[1].push(21);
        v[1].push(22);
        v[1].push(23);

        check(v,0,1);
        check(v,0,4);
        check(v,0,7);
        check(v,1,1);
        check(v,1,21);
        check(v,3,3);
        trace(v);
    }

    private function check(v:*, d1:int, d2:int):void {
        if(Utils.safeVector2dCheck(v,d1,d2)){
            trace("yes", d1, d2);
        }else {
            trace("no", d1, d2);
        }
    }
}
}
