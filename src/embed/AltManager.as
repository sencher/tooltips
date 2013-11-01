
package embed {

import flash.display.MovieClip;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.ui.Keyboard;

[SWF(backgroundColor="#FFFFFF", width="600", height="600", frameRate="29")]
public class AltManager extends MovieClip{

    [Embed(source="../swf/bubble_3d.swf", symbol="g1")]
    public var g1:Class;


    private var _window:*;
    private var _dragged_window:*;

    private var pos:int = 50;
    private var step:int = 50;

    private var _params:AltWindowParameters = new AltWindowParameters();

    public function AltManager() {
        addChild(new g1());


        _params.title_text = "ПОЕБЕНЬ!";
        _params.callback = test;
        generate_tip(AltWindowGreenProgressButton);

        _params.title_text = "ХУЕТЕНЬ";
        _params.info_text = "Убрать";

        generate_tip(AltWindowBase);
        generate_tip(AltWindowRedProgress);
        generate_tip(AltWindowGreenProgressButton);

        stage.addEventListener(KeyboardEvent.KEY_UP, on_key)
    }

    private function test():void {
        trace("HERE");
    }

    public function generate_tip(_class:Class):void {
        pos += step;
        _params.position = new Point(pos, pos);
        _window = new _class(_params);
        addChild(_window);
        add_move(_window);
    }

    private function on_key(event:KeyboardEvent):void {
        switch (event.keyCode)
        {
            case Keyboard.NUMBER_0:
                _window.set_progress(0);
                break;
         case Keyboard.NUMBER_1:
                _window.set_progress(0.12);
                break;
        case Keyboard.NUMBER_2:
                _window.set_progress(0.38);
                break;
        case Keyboard.NUMBER_3:
                _window.set_progress(0.91);
                break;
        }
    }

    private function add_move(mc:MovieClip):void {
        mc.addEventListener(MouseEvent.CLICK, on_click);
    }

    private function on_click(event:MouseEvent):void {
        var t:* = event.currentTarget;

        if(_dragged_window)
        {
            _dragged_window.stopDrag();
            _dragged_window = null;
        }else{
            t.startDrag();
            _dragged_window = t;
        }
    }
}
}
