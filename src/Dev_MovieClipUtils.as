package {

import com.junkbyte.console.Cc;

import wowp.utils.MovieClipUtils;

public class Dev_MovieClipUtils extends BaseTest {
    private var s1:HiddenSprite2 = new HiddenSprite2();
    
    public function Dev_MovieClipUtils() {
        showConsole();
        addChild(s1);
        Cc.green2(MovieClipUtils.getParentList(s1));
//        var m:MovieClip = new MovieClip();
//        m.currentFrame
    }
}
}

import flash.display.MovieClip;

class HiddenSprite extends MovieClip {

}
class HiddenSprite2 extends HiddenSprite {

}