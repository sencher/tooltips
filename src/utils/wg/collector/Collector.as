package utils.wg.collector {

import flash.events.Event;
import flash.events.EventDispatcher;

public class Collector {
    
    private var counter:int;
    private var eventDispatcher:EventDispatcher;
    private var eventName:String;
    private var limit:int;
    private var callback:Function;
    private var repetable:Boolean;
    
    public function Collector() {
    }
    
    public function start(eventDispatcher:EventDispatcher, eventName:String, limit:int, callback:Function, repetable:Boolean = false):void {
        dispose();
        
        counter = 0;
        this.eventDispatcher = eventDispatcher;
        this.eventName = eventName;
        this.limit = limit;
        this.callback = callback;
        this.repetable = repetable;
        
        //Cc.logcw(this, "Collector", arguments);
        eventDispatcher.addEventListener(eventName, collect);
    }
    
    public function dispose():void {
        //Cc.logcw(this, "dispose");
        if (eventDispatcher && eventName) eventDispatcher.removeEventListener(eventName, collect);
        eventDispatcher = null;
        callback = null;
    }
    
    private function collect(event:Event = null):void {
        //Cc.logcw(this, "collect", counter + 1, " of ", limit);
        if (++counter >= limit) {
            //Cc.error("callback");
            callback();
            if (repetable) {
                counter = 0;
            } else {
                dispose();
            }
        }
    }
}
}
