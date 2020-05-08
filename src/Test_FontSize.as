package {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

import utils.FontUtils;
import utils.Utils;

public class Test_FontSize extends Sprite {
    private const SPACE:Number = 50;
    private var tf:TextField = new TextField();
    public function Test_FontSize() {
        tf.width = 200;
        tf.height = 100;
        tf.border = true;
        addChild(tf);

        var space:Shape = Utils.createBox(0,0,SPACE,SPACE);
        space.alpha = 0.2;
        space.x = tf.width - SPACE;
        addChild(space);

        stage.addEventListener(MouseEvent.CLICK, onClick);
        onClick();
    }

    private function onClick(event:MouseEvent = null):void {
        tf.text = Utils.generateRandomString(Utils.getRandom(0, 10));
        FontUtils.adjustFontSize(tf, 40, SPACE);
    }
}
}
