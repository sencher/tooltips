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
        mc.name = "mc";

        //cast to parent type is ok
        var s1:Sprite = mc as Sprite;
        var s2:Sprite = Sprite(mc);
        trace(s1, s2, s1.name, s2.name);

        //cast to child type
        //just null
        var mc1:MovieClip = s as MovieClip;
        try{
            //strict cast throws error
            var mc2:MovieClip = MovieClip(s);
        }catch(e:Error){
            trace(e.message);
        }

        trace(mc1, mc2);
    }
}
}
