/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 30.05.13
 * Time: 17:38
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.MovieClip;
import flash.display.Sprite;

public class Test_Cast extends Sprite{
    public function Test_Cast() {
        var s:Sprite = new Sprite();
        s.name = "sprite";
        var mc:MovieClip = new MovieClip();
        mc.name = "mc"
        var ss:Sprite = mc as Sprite;
        trace(ss.name);
        var mc2:MovieClip = MovieClip(s)
//        var mc2:MovieClip = MovieClip(s);
        trace(mc2.name)
    }
}
}
