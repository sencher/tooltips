package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;

public class Test_StaticLink extends Sprite {
    public static const ACTIVE_TOTEMS:Array = [6, 7, 8, 5];
    
    public function Test_StaticLink() {
        var activeTotems:Array = Test_StaticLink.ACTIVE_TOTEMS;
        trace(ACTIVE_TOTEMS);
        trace(activeTotems.length);
        
        Cc.start(this);
        Cc.visible=true;
        
        method();
    }
    
    private function method():void {
        Cc.debug(132);
    }
}
}
