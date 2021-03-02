package {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class Test_EventListener extends Sprite {
    public function Test_EventListener() {
        var s:Sprite = new Sprite();
        s.removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
    }
    
    private function onRollOver(event:MouseEvent):void {
        trace("onRollOver");
    }
}
}
