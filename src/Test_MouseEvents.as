package {
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;

import utils.Utils;

public class Test_MouseEvents extends Sprite {
    private var box:Shape;
    public function Test_MouseEvents() {
        var container:MovieClip = new MovieClip();
        box = Utils.drawBox(100,100,200,200,0,0xffff00);
        box.name = "box";
        addChild(container);
        container.addChild(box);

        container.addEventListener(MouseEvent.CLICK, onMouse)
        container.addEventListener(MouseEvent.MOUSE_UP, onMouse)
        container.addEventListener(MouseEvent.MOUSE_DOWN, onMouse)
        container.addEventListener(MouseEvent.ROLL_OVER, onMouse)
        container.addEventListener(MouseEvent.ROLL_OUT, onMouse)
    }

    private function onMouse(event:*):void {
        trace(event.type);
    }
}
}
