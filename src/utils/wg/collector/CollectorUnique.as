package utils.wg.collector {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Dictionary;
import flash.utils.Timer;

public class CollectorUnique {
    public var timeLimit:int = 3000;
    
    private var timer:Timer;
    private var counter:int;
    private var eventDispatcher:EventDispatcher;
    private var eventName:String;
    private var limit:int;
    private var callback:Function;
    private var duplicateChildEvents:Dictionary;
    
    public function CollectorUnique() {
    }
    
    public function start(eventDispatcher:EventDispatcher, eventName:String, limit:int, callback:Function):void {
        //Cc.logcw(this, "Collector", arguments);
        
        dispose();
        
        duplicateChildEvents = new Dictionary();
        counter = 0;
        this.eventDispatcher = eventDispatcher;
        this.eventName = eventName;
        this.limit = limit;
        this.callback = callback;
        
        eventDispatcher.addEventListener(eventName, collect);
        
        timer = new Timer(timeLimit);
        timer.addEventListener(TimerEvent.TIMER, timerHandler);
        timer.start();
    }
    
    public function dispose():void {
        //Cc.logcw(this, "dispose");
        if (eventDispatcher && eventName) eventDispatcher.removeEventListener(eventName, collect);
        eventDispatcher = null;
        callback = null;
        duplicateChildEvents = null;
        if (timer) {
            timer.stop();
            timer = null;
        }
    }
    
    private function timerHandler(event:TimerEvent):void {
        //Cc.errorch(this, "Collector time limit!");
        callback();
        dispose();
    }
    
    private function collect(event:Event = null):void {
        var target:* = event.target;
        //Cc.logc(this,"collect", target);
        
        if (duplicateChildEvents[target]) {
            //Cc.warnch(this,"duplicate", target);
            return;
        }
        
        //Cc.infoch(this,"counted", target, counter + 1);
        duplicateChildEvents[target] = 1;
        
        if (++counter >= limit) {
            //Cc.errorch(this,"callback");
            callback();
            dispose();
        }
    }
}
}
