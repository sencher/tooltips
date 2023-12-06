package {
import com.junkbyte.console.Cc;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;
import flash.text.TextFormat;

import utils.Utils;

public class Test_TextField extends Sprite {
    private var tf:TextField = new TextField();
    private var box:Shape;
    public function Test_TextField() {

        box = Utils.createBox(100,100,300,100);
        addChild(box);
        var f:TextFormat = new TextFormat();
        f.font = "Courier";
        f.font = "Myriad Pro";
        f.font = "VAGRoundedBT";
        f.size = 40;

        tf.setTextFormat(f);
        tf.defaultTextFormat = f;

        tf.width = tf.height = 1014;
        tf.multiline = true;
        tf.borderColor = 0xff7700;
        tf.wordWrap = true;
        tf.text = "555\n3redddddddddddddddd";
        tf.type = TextFieldType.INPUT;
        tf.border = true;
        addChild(tf);
        if(stage) stage.addEventListener(MouseEvent.CLICK, onClick);
        onClick();
        Cc.green2("dummy");
    }

    private function onClick(event:MouseEvent = null):void {
        tf.x = box.x + box.width/2 - tf.textWidth/2;
        tf.y = box.y + box.height/2 - tf.textHeight/2;
        tf.width = tf.textWidth + 10;
        tf.height = tf.textHeight + 10;
        trace(tf.textWidth, tf.width, tf.textHeight, tf.height);
    }
}
}
