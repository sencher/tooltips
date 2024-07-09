package {

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

[SWF(height='1000', width='500')]
public class Test_Timer2 extends BaseTest {
    private var timer:Timer = new Timer(1000, 2);
    public function Test_Timer2() {
        timer.addEventListener(TimerEvent.TIMER, onTimer);
        timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
        stage.addEventListener(MouseEvent.CLICK, onClick);
    }
    
    private function onClick(event:MouseEvent):void {
        timer.reset();
        timer.start();
    }
    
    private function onTimerComplete(event:TimerEvent):void {
        log("onTimerComplete");
    }
    
    private function onTimer(event:TimerEvent):void {
        log("onTimer");
    }
}
}
