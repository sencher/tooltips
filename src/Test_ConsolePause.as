package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.utils.Timer;

[SWF(width=1000, height=1000)]
public class Test_ConsolePause extends Sprite {
    private var timer:Timer;
    private var counter:int = 0;

    public function Test_ConsolePause() {
        super();
        Cc.start(this);
        Cc.width=Cc.height=1000;
        timer = new Timer(1);
        timer.addEventListener(TimerEvent.TIMER, onTimer);
        timer.start();
    }

    private function onTimer(event:TimerEvent):void {
        Cc.green2(counter++);
    }
}
}
