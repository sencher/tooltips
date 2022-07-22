package {

import flash.display.Sprite;

import utils.GamuaFloxUtils;

import utils.Utils;

public class Test_Clone2dArray extends Sprite {
    public function Test_Clone2dArray() {
        var a1:Array = [1,2,[3,4]];
//        var a2 = Utils.clone(a1);
        var a2 = GamuaFloxUtils.cloneObject(a1);
        
        
        a1[0] += 10;
        a2[2][1] += 10;
        trace(a1, a2);
    }
}
}
