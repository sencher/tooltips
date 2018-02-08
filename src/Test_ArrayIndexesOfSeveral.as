package {
import flash.display.Sprite;

import utils.Utils;

public class Test_ArrayIndexesOfSeveral extends Sprite {
    public function Test_ArrayIndexesOfSeveral() {
        var arr:Array = [0,1,2,1,1,0,1,5];
        trace(arr.indexOf(1));
        var ids:Array = Utils.getIndexes(arr, 1);
        trace(ids);

        var arr2:Array = ["a","c","d","a","c","c","a"];
        trace(arr2.indexOf("c"));
        var ids2:Array = Utils.getIndexes(arr2, "c");
        trace(ids2);

        var o1:Object = new Object();
        var o2:Object = new Object();
        var arr3:Array = [o1,o1,o2,o2,o2,o1];
        trace(arr3.indexOf(o1));
        var ids3:Array = Utils.getIndexes(arr3, o1);
        trace(ids3);
    }
}
}
