package {

import com.greensock.TweenLite;
import com.junkbyte.console.Cc;

import flash.events.Event;

import flash.events.TimerEvent;

import flash.utils.Timer;
import flash.utils.getTimer;

public class Dev_ConsoleWorkHidden extends BaseTest {
    
    private const START_DELAY:int = 8;
    private const TICK:int = 500;
    private const MAX_TICKS:int = 20;
    private var tickTImer:Timer;// = new Timer(TICK, MAX_TICKS);
    private var counter:int;
    
    public function Dev_ConsoleWorkHidden() {
        //cause for 8 seconds lag on start all timers doesn`t respond.
        TweenLite.delayedCall(START_DELAY, init);
    }
    
    private function init():void {
        Cc.green2cw(this, "init ms:", elapsedTime());
//        Cc.config.flashTrace = false;
        tickTImer = new Timer(TICK, MAX_TICKS);
        tickTImer.addEventListener(TimerEvent.TIMER, tickTimer_handler);
        tickTImer.start();
//        TweenLite.delayedCall(1, tickTimer_handler)
    }
    
    private function tickTimer_handler(event:TimerEvent = null):void {
        counter++;
        trace(counter, "tickTimer_handler ms:", elapsedTime());
        switch (counter) {
            case 1:
                Cc.pink(counter,"object", {a:7}, elapsedTime());
                break;
            case 2:
                Cc.orangecw(counter,"array", [3,4,9,1,"zzz",15], elapsedTime());
                break;
            case 13:
                //showConsole();
                break;
            case 4:
                Cc.yellowcw(this, counter,"after", {b:99}, elapsedTime());
                break;
            case 15:
                Cc.pink(counter,"object", {a:7}, elapsedTime());
                break;
            case 6:
                Cc.pink(counter,"object", {a:7}, elapsedTime());
                showConsole();
                break;
            case 7:
                Cc.pink(counter, "object", {a:7}, elapsedTime());
                break;
            case 18:
                Cc.pink(counter, "object", {a:7}, elapsedTime());
                break;
            default:
                Cc.grey(counter, elapsedTime());
                break;
        }
    }
}
}
