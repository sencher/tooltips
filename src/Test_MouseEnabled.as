package {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

import utils.Utils;

public class Test_MouseEnabled extends Sprite {
    public function Test_MouseEnabled() {
        var box = Utils.createButton();
        addChild(box);
        var tf:TextField = new TextField();
        tf.width = 500;
        tf.height = 50;
        tf.border = true;
        tf.text = "fdlkgklfdg";
        tf.mouseEnabled = false;
        addChild(tf);
        box.addEventListener(MouseEvent.MOUSE_OVER, over)
        box.addEventListener(MouseEvent.MOUSE_OUT, out)
    }
    
    private function out(event:MouseEvent):void {
        trace("out");
    }
    
    private function over(event:MouseEvent):void {
        trace("over");
    }
}
}
