package {
import flash.display.Sprite;
import flash.system.Security;

public class Test_FlaMovieClip extends Sprite {
    public function Test_FlaMovieClip() {
//        Security.allowDomain("*");
//        try {
//            var holder:* = new WCPrizeHolderClass();
//            addChild(holder);
//        }catch (e) {
//
//        }
    
        var holder:* = new container();
        addChild(holder);
        trace(holder.mc2.visible)
        holder.mc2.visible = true;
    }
}
}
