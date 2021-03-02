package {
import flash.display.Sprite;

public class Test_OR extends Sprite {
    public function Test_OR() {
//        var a:String = null;
        var a:String = "A";
        var b:String = "B";
        trace(a || b);
        trace(b || a);
    }
}
}
