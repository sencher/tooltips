package {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;

import utils.Utils;

public class CheatEngine extends Sprite {
    private var button:Sprite;
    private var box:Shape;
    private var bool:Boolean;
    public function CheatEngine() {
        button = Utils.createButton();
        button.addEventListener(MouseEvent.CLICK, button_clickHandler);
        addChild(button);

        box = Utils.createBox();
        box.x = 100;
        addChild(box);

    }

    private function button_clickHandler(event:MouseEvent):void {
        box.visible = !box.visible;
//        trace(1, bool);
//        bool = !bool;
//        trace(2, bool);
    }
}
}
