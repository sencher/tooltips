package {
import flash.display.Sprite;

public class Test_ArrayCopyReverse extends Sprite {
    public function Test_ArrayCopyReverse() {
        var arr1:Array = [1,2,3];
        var arr2:Array = arr1.concat().reverse();
        trace(arr1)
        trace(arr2)
    }
}
}
