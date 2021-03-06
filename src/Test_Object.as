package {
import flash.display.Sprite;

import utils.Utils;

public class Test_Object extends Sprite {
    public function Test_Object() {
        var o1:* = {1: 1, 2: 2, 3: 3};
        var o2:* = {1: 2, 2: 3, 3: 4};
        var o3:* = {3: 1, 4: 2, 5: 3};
        var o4:* = {8: 1, 2: 2, 3: 3};

        Utils.mergeObjects(o1, o2, true);
        Utils.mergeObjects(o1, o3, true);
        Utils.substractObjects(o1, o3);
        Utils.substractObjects(o1, o4);

        var o:Object = {foo: "hello", bar: "world", a: 5};
        trace(objectLength(o)); // output

        var a:Object = {val: 1};
        var b:Object = {val: 7};
        var c:Object = {};
        c[a] = 8;
        c[b] = 12;
        trace(c[a]);
        trace(c[b]);
        trace(c["a"]);
        trace(c["b"]);
    }

    private function objectLength(myObject:Object):int {
        var cnt:int = 0;

        for (var s:String in myObject) cnt++;

        return cnt;
    }
}
}
