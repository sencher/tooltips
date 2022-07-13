package {

import flash.display.Sprite;

public class Test_IndexOf extends Sprite {
    public function Test_IndexOf() {
        var type:String = "crew";
        trace(type.indexOf("a"));
        trace(type.indexOf(""));
        trace(type.indexOf("*"));
        trace(type.indexOf("/*"));
        trace(type.indexOf("\*"));
    }
}
}
