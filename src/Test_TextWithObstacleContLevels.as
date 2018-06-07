package {
import com.junkbyte.console.Cc;

import components.ObstacleTextField;

import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;

import flashx.textLayout.formats.TextAlign;

import utils.FontUtils;
import utils.Utils;

[SWF(width="800")]
public class Test_TextWithObstacleContLevels extends Sprite {

    private const INIT_SIZE:int = 30;

    private var tf:TextField = new TextField();
    private var initFormat:TextFormat;
    private var box:Sprite;
    private var box2:Sprite;
    private var counter:int = 0;

    private var obstacleTF:ObstacleTextField;
    private var dragged:Boolean;
    private var dragTarget:Object;
    private var container:Sprite = new Sprite();

    public function Test_TextWithObstacleContLevels() {
        Cc.start(this);

        container.name = "container";
        container.x = 10;
        container.y = 10;
        addChild(container);

        initFormat = new TextFormat();
        initFormat.size = INIT_SIZE;
        initFormat.font = FontUtils.FONT_NAME_OPEN_SANS_SEMIBOLD;
        initFormat.color = 0x990000;
        initFormat.align = TextAlign.CENTER;
        counter = 1;

        tf.defaultTextFormat = initFormat;
        tf.x = tf.y = 100;
        tf.width = 400;
        tf.border = true;
        tf.text = "1234567890abcdefghjk";
        container.addChild(tf);

        var middleSprite:Sprite = new Sprite();
        middleSprite.name = "middleSprite";
        middleSprite.x = 10;
        middleSprite.y = 10;
        container.addChild(middleSprite);

        box = new Sprite();
        box.alpha = 0.5;
        box.x = 100;
        box.y = 100;
        box.addChild(Utils.drawBox());
        middleSprite.addChild(box);

        box2 = new Sprite();
        box2.alpha = 0.3;
        box2.x = 550;
        box2.y = 171;
        box2.rotation = 35;
        box2.addChild(Utils.drawBox());
        addChild(box2);

        obstacleTF = new ObstacleTextField(tf, [box, box2], true);
        box.addEventListener(MouseEvent.CLICK, drag);
        box2.addEventListener(MouseEvent.CLICK, drag);
        stage.addEventListener(KeyboardEvent.KEY_UP, onKey);
    }

    private function drag(event:MouseEvent):void {
        if (!dragged) {
            dragTarget = event.currentTarget;
            stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
        } else {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
        }
        dragged = !dragged;
    }

    private function onMove(event:MouseEvent):void {
        dragTarget.x = dragTarget.parent.mouseX - dragTarget.width / 2;
        dragTarget.y = dragTarget.parent.mouseY - dragTarget.height / 2;
    }

    private function onKey(event:KeyboardEvent):void {
        if (event.ctrlKey) {
            var format:TextFormat = tf.getTextFormat();
            counter++;
            switch (counter) {
                case 0:
                case 4:
                    counter = 0;
                    format.align = TextAlign.LEFT;
                    break;
                case 1:
                    format.align = TextAlign.CENTER;
                    break;
                case 2:
                    format.align = TextAlign.JUSTIFY;
                    break;
                case 3:
                    format.align = TextAlign.RIGHT;
                    break;
//                format.align = TextAlign.END;
//                format.align = TextAlign.START;
            }

            tf.defaultTextFormat = format;
            tf.setTextFormat(format);
        }
        obstacleTF.update();
    }


}
}
