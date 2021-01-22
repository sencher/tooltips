package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;

public class Test_CcCheck extends Sprite {
    public function Test_CcCheck() {
        if(Cc.visible){
            trace("yes");
        }else{
            trace("no");
        }
    }
}
}
