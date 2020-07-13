package {
import flash.display.Sprite;

import utils.ArrayWithNegative;
import utils.Utils;

public class Test_ArrayIndexes extends Sprite {
    private var array:Array = [];
    
    public function Test_ArrayIndexes() {
        array[int.MAX_VALUE+10000] = 122;
        array[int.MAX_VALUE+1000] = 123;
        array[int.MIN_VALUE-10000] = 1;
        array[-3] = 3;
        array[-7] = 7;
        array[-6] = 6;
        trace(array[int.MAX_VALUE+10000]);
        trace(array[int.MAX_VALUE+1000]);
        Utils.traceArrayWithIndexes(array);
    }
}
}
