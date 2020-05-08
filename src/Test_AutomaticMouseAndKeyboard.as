package {
import flash.display.Sprite;
import flash.display.Stage;

import utils.Utils;

import utils.Utils;

[SWF(width=800,height=800)]
public class Test_AutomaticMouseAndKeyboard extends Sprite {
    public static const BUTTON_SIZE:int = 25;
    private const BUTTONS:int = 16;

    public function Test_AutomaticMouseAndKeyboard() {
        var currentButton:ButtonWithCounter;

        for (var i:int = 0; i < BUTTONS; i++) {
            currentButton = new ButtonWithCounter();
            currentButton.x = Utils.getRandom(0, stage.stageWidth - BUTTON_SIZE);
            currentButton.y = Utils.getRandom(0, stage.stageHeight - BUTTON_SIZE);
            addChild(currentButton);
        }
    }
}
}

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

import utils.Utils;

class ButtonWithCounter extends Sprite {
    private var sprite:Sprite;
    private var counter:int = 0;
    private var tf:TextField = new TextField();

    function ButtonWithCounter() {
        sprite = Utils.createButton(0, 0, Test_AutomaticMouseAndKeyboard.BUTTON_SIZE, Test_AutomaticMouseAndKeyboard.BUTTON_SIZE);
        tf.selectable = false;
        tf.mouseEnabled = false;
        tf.width = tf.height = Test_AutomaticMouseAndKeyboard.BUTTON_SIZE;
        addChild(sprite);
        addChild(tf);
        updateTextField(counter);
        sprite.addEventListener(MouseEvent.CLICK, clickHandler);
    }

    private function clickHandler(event:MouseEvent):void {
        counter++;
        updateTextField(counter);
    }

    private function updateTextField(value:*):void {
        tf.text = value.toString();
    }
}
