package {
import flash.display.Sprite;

import mx.utils.LinkedList;

public class Test_LinkedObjectReset extends Sprite {
    private var l:Array;
    public function Test_LinkedObjectReset() {
        l = new Array();
        var a:Sprite = new Sprite();
        a.name = "a";
        var b:Sprite = new Sprite();
        b.name = "b";
        l.push(a);
        l.push(b);

        trace(l.length);
        func(l);
        trace(l.length);
    }

    private function func(list:Array):void {
        //list = new LinkedList();
        //delete list;
        list = null;

    }
}
}
