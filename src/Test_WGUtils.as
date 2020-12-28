package {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

import utils.wg.utils.string.reduceNumber;

public class Test_WGUtils extends Sprite {
    public function Test_WGUtils() {
        var format:TextFormat = new TextFormat();
        format.size = 40;
        var tf:TextField = new TextField();
        tf.width = stage.stageWidth;
        tf.defaultTextFormat = format;
        addChild(tf);
        tf.htmlText = reduceNumber(10000);
    }
}
}
