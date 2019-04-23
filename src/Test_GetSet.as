package {
import flash.display.Sprite;

public class Test_GetSet extends Sprite {
    public function Test_GetSet() {
        super();
        var inner:Inner = new Inner(7);
        trace(inner.index);
        inner.index222 = 18;
        trace(inner.index);
    }
}
}

class Inner{
    private var _index:int;

    public function Inner(index:int = 0){
        _index = index;
    }

    public function get index():int {
        return _index;
    }

    public function set index222(value:int):void {
        _index = value;
    }
}