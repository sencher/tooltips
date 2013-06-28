/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 27.05.13
 * Time: 18:15
 * To change this template use File | Settings | File Templates.
 */
package {
import Interfaces.File1;
import Interfaces.File2;


import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.geom.Point;
import flash.utils.describeType;

public class Test_Interview extends Sprite{
    public function Test_Interview() {
        trace(typeof (null))
        trace(typeof (undefined))
        var o:Object = {a:1}
        var some = 10;
        o.a = some;
        if(some in o) trace("BINGO");

//        var v:Vector.<DisplayObject> = new Vector.<Sprite>;
        var b:Vector.<Sprite> = new Vector.<Sprite>;

        var f1:File1 = new File1();
        var f2:File2 = new File2();

        var d1:XML = describeType(f1);
        var d2:XML = describeType(f2);

        trace(f1.b);
//        get



    }
}
}
