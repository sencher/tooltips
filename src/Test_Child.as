/**
 * Created with IntelliJ IDEA.
 * User: User
 * Date: 27.05.13
 * Time: 17:50
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.MovieClip;
import flash.display.Sprite;

import folder.First;

import folder.First;

public class Test_Child extends Sprite{
    public function Test_Child() {
        var s:Sprite = new Sprite();
        var mc:MovieClip = new MovieClip();
        var f:First = new First();
        f.x = 5
        s = f;
        trace(s.x)
        First(s).SomeFunc();
//        mc = s;

    }
}
}
