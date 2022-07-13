package utils.collector {

import flash.events.Event;
import flash.utils.Dictionary;

public class Collector2Prototype {
    
    private var eventName:String;
    private var callback:Function;
    private var sources:Dictionary;
    
    public function Collector2Prototype() {
    }
    
    private function get allSourcesCollected():Boolean {
        for each (var isCollected:int in sources) {
            if (isCollected == 0) {
                return false;
            }
        }
        
        return true;
    }
    
    public function addSource(value:*):void {
        if (!sources) {
            sources = new Dictionary();
        }
        sources[value] = 0;
    }
    
    public function start(eventName:String, callback:Function):void {
        this.eventName = eventName;
        this.callback = callback;
        
        for (var source:* in sources) {
            source.addEventListener(eventName, collect);
        }
    }
    
    public function addPackageAndStart(sourcesArray:*, eventName:String, callback:Function):void {
        dispose();
        for each (var source:* in sourcesArray){
            addSource(source);
        }
        
        start(eventName, callback);
    }
    
    public function dispose():void {
        //Cc.logchw(this, "dispose");
        for (var source:* in sources) {
            source.removeEventListener(eventName, collect);
        }
        sources = null;
        callback = null;
    }
    
    public function toString():String {
        var result:String = "";
        
        for (var source:* in sources) {
            result += (sources[source]).toString() + ",";
        }
        
        return result;
    }
    
    private function collect(event:Event = null):void {
        //Cc.logchw(this, "collect", event.target);
        sources[event.target] = 1;
        event.target.removeEventListener(eventName, collect);
        if (allSourcesCollected) {
            callback();
            dispose();
        }
    }
}
}
