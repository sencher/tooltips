/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 14.05.13
 * Time: 18:15
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.geom.Point;
import flash.text.TextField;

import folder.First;
import folder.Second;
import folder.Third;

import mx.core.FlexTextField;

    import utils.Hash;

    public class Test_ClassesCompare extends Sprite{

    private var h:Hash;

    public function Test_ClassesCompare() {

        h = new Hash();
        h.setKey(3,new First())
        h.setKey(9,new Second())
        h.setKey(7,new Third())

//        var a:* = h.getKey(3);
//        trace(a);
//
//        for each (var value:* in h) {
//            trace(value)
//        }
//
//        for (var k:Object in h) {
//            var value:*=h[k];
//            var key:*=k;
//            trace(key, value);
//        }

//        trace(get_window_by_class_name(BaseWindow).name);
//        trace(get_window_by_class_name(Sprite).name);
//        trace(get_window_by_class_name(MovieClip).name);
//        trace(get_window_by_class_name(Point));

        trace(get_window_by_class_name(First));
        trace(get_window_by_class_name(Second));
        trace(get_window_by_class_name(Third));
        trace(get_window_by_class_name(Point));

        trace(get_window_by_class_name2(First));
        trace(get_window_by_class_name2(Second));
        trace(get_window_by_class_name2(Third));
        trace(get_window_by_class_name2(Point));
    }

    private function get_window_by_class_name(window_class:Class):*
    {
        for each (var value:* in h) {
            var v:* = String(value)
            var w:* = String(window_class)
            if(String(value) == String(window_class))
            {
                return value;
            }
        }

        return null;
    }

    private function get_window_by_class_name2(window_class:Class):*
    {
        for each (var value:* in h) {
            var v:* = String(value)
            var w:* = String(window_class)
            if(value is window_class)
            {
                return value;
            }
        }

        return null;
    }
}
}
