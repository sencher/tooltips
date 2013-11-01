/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 30.05.13
 * Time: 17:38
 * To change this template use File | Settings | File Templates.
 */
package {
import embed.AltButtonParams;

import flash.display.Sprite;

public class Test_Vector extends Sprite{
    public function Test_Vector() {
        var v:Vector.<AltButtonParams> = new Vector.<AltButtonParams>();

        var p1:AltButtonParams = new AltButtonParams();
        p1.type = AltButtonParams.BLUE;

        var p2:AltButtonParams = new AltButtonParams();
        p2.type = AltButtonParams.GREEN;

        var p3:AltButtonParams = new AltButtonParams();
        p3.type = AltButtonParams.ORANGE_WITH_ICON;

        v.push(p1, p2, p3)

        var i:AltButtonParams;
        for each(i in v)
        {
            trace(i.type);
        }

    }
}
}
