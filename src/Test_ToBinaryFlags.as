package {

import flash.display.Sprite;

public class Test_ToBinaryFlags extends Sprite {
    public function Test_ToBinaryFlags() {
        trace(toBinaryFlags([]));
        trace(toBinaryFlags([1]));
        trace(toBinaryFlags([2]));
        trace(toBinaryFlags([1,3]));
        trace(toBinaryFlags([1,3,7]));
        trace(toBinaryFlags([11]));
    }
    
    
    private function toBinaryFlags(value:Array):Array {
        var result:Array = [];
        for (var i:int = 0; i < value.length; i++) {
            result[value[i] - 1] = 1;
        }
        
        return result;
    }
}
}
