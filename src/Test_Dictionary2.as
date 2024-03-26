package {

import flash.display.Sprite;
import flash.utils.Dictionary;

public class Test_Dictionary2 extends Sprite {
    public function Test_Dictionary2() {
        var dict = new Dictionary();
        var obj = new Object();
        var key:Object = new Object();
        key.toString = function() { return "key" }
    
        dict[key] = "Letters";
        obj["key"] = "Letters";
    
        trace(dict[key] == "Letters"); // true
        trace(obj["key"] == "Letters"); // true
        trace(obj[key] == "Letters"); // true because key == "key" is true b/c key.toString == "key"
        trace(dict["key"] == "Letters"); // false because "key" === key is false
        delete dict[key]; //removes the key
    }
}
}
