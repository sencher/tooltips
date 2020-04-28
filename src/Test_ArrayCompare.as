package {
import flash.display.Sprite;

import mx.utils.ObjectUtil;

public class Test_ArrayCompare extends Sprite {
    public function Test_ArrayCompare() {
        var arr1:Array = [1,2,3];
        if(arr1 === [1,2,3]){
            trace("true");
        }

        trace(ObjectUtil.compare(arr1, [1,2]));
        trace(ObjectUtil.compare(arr1, [1,2,3]));
        trace(ObjectUtil.compare(arr1, [1,2,4]));
        trace(ObjectUtil.compare(arr1, []));


        if(ObjectUtil.compare(arr1, [1,2,3]) == 0){
            trace("true2");
        }
    }
}
}
