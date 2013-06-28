/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 19.06.13
 * Time: 15:53
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;

public class Test_Hex_Color extends Sprite{
    private var red:Number = 15;
    private var green:Number = 100;
    private var blue:Number = 150;
    public function Test_Hex_Color() {
        var hexVal:String = red.toString(16) + green.toString(16) + blue.toString(16);
        var color:uint = uint("0x" + hexVal);
        trace(hexVal, color)
    }
}
}
