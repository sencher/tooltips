/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 13.06.13
 * Time: 20:30
 * To change this template use File | Settings | File Templates.
 */
package {
import Interfaces.File1;
import Interfaces.File2;
import Interfaces.IBusSelectableIcon;
import Interfaces.ISelectableIcon;

import flash.display.Sprite;

public class Test_Interfaces extends Sprite{
    public function Test_Interfaces() {
        var a:File1 = new File1();
        var b:File2 = new File2();
        var arr:Array = [a, b];
        for each(var i:IBusSelectableIcon in arr)
        {
           trace(i.is_investigated);
           trace(i.selected);
        }
    }


}
}
