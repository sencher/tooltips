package {
import flash.display.Sprite;

public class Test_ArrayRandomize extends Sprite {
    public function Test_ArrayRandomize() {
        var arr:Array = [];
        for (var i:int = 0; i < 10; i++) {
            arr.push(i);
        }

        trace(arr);

        arr.sort(randomize);
        trace(arr);

        arr.sort(randomize);
        trace(arr);
    }

    private function randomize ( a : *, b : * ) : int {
        return ( Math.random() < .5 ) ? 1 : -1;
    }
}
}
