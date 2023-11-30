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
        box = Utils.createBox(100,100,200,200,0,0xffff00);
        box.name = "box";
        addChild(container);
        container.addChild(box);

        container.addEventListener(MouseEvent.CLICK, onMouse);
        container.addEventListener(MouseEvent.MOUSE_UP, onMouse);
        container.addEventListener(MouseEvent.MOUSE_DOWN, onMouse);
        container.addEventListener(MouseEvent.ROLL_OVER, onMouse);
        container.addEventListener(MouseEvent.ROLL_OUT, onMouse);

        //MouseEvents are tracked outside of the application window if the MOUSE_DOWN event has been fired, but not MOUSE_UP.
        // You can grab mouse positions outside of the application window (and even outside of the browser window) as long as
        // whatever you're doing makes the user hold their mouse down.
        //stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouse);
        
        //container.enabled = false;
        container.mouseEnabled = false;
    }

    private function onMouse(event:MouseEvent = null):void {
        trace(event.type, event.stageX, event.stageY);
    }
}
}
