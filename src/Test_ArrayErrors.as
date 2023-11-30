package {

import flash.display.Sprite;

public class Test_ArrayErrors extends Sprite {
    public function Test_ArrayErrors() {
        var arr:Array = [];
        trace(arr[arr.length - 1]);
    }
}
}
