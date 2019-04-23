package {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class Test_TimeElapsed extends Sprite {
    private var prevTime:int;
    public function Test_TimeElapsed() {
        prevTime = new Date().time;
        stage.addEventListener(MouseEvent.CLICK, onClick)
    }

    private function onClick(event:MouseEvent):void {
        var date:Date = new Date();
        var time:int = date.time;
        trace("Elapsed :", time - prevTime);
        prevTime = time;
    }
}
}
