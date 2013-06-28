/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 27.05.13
 * Time: 18:15
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;
import flash.geom.Point;
import flash.geom.Point;

public class Test_LocalGlobal extends Sprite{
    public function Test_LocalGlobal() {
        var mc1:Sprite = new Sprite();
        var mc2:Sprite = new Sprite();
        var mc3:Sprite = new Sprite();
        addChild(mc1);
        mc1.addChild(mc2);
        mc2.addChild(mc3);


        mc1.x = 10;
        mc2.x = 10;
        mc3.x = 10;

        var p:Point = new Point(100,0);

        var lp:Point = mc3.globalToLocal(p);
        trace(lp)




//        mc3.localToGlobal(new Point());
    }
}
}
