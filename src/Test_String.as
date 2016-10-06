/**
 * Created with IntelliJ IDEA.
 * User: SenCheR
 * Date: 04.12.13
 * Time: 23:40
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;

public class Test_String extends Sprite{
    public function Test_String() {
        var s1:String = /*"1%3D2"//*/"https://goldentriumph-dev.emict.net/flash/main.swf?config=https%3A%2F%2Fgoldentriumph-dev.emict.net%2Fgame_flash.html%3Fconfig%3D1%26code%3D372189-3927%26terminal%3D1000002%26hid%3DC6DFB473311741F9B158400D951DAA4A";
        var s2:String = "https://goldentriumph-dev.emict.net/game_flash.html?config=1&code=372189-3927&terminal=1000002&hid=C6DFB473311741F9B158400D951DAA4A";

        var s11:String = s1.replace(/%3D/g,"=");
        var s22:String = s2.replace(/%3D/g,"=");
        trace(s11);
        trace(s22);
        var i = s11.lastIndexOf("=");
        var i2 = s22.lastIndexOf("=");
        trace(i, i2);
        var hid:String = s11.substr(i+1);
        var hid2:String = s22.substr(i2+1);
        trace(hid);
        trace(hid2);

        //short
//        var hid11:String = s1.replace(/%3D/g,"=").substr(i+1);
//        trace(hid11);
    }
}
}
