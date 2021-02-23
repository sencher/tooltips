package {
import flash.display.Sprite;
import flash.system.Security;

public class Test_FlaMovieClip extends Sprite {
    public function Test_FlaMovieClip() {
        Security.allowDomain("*");
        
        var holder:* = new WCPrizeHolderClass();
        addChild(holder);
    }
}
}
