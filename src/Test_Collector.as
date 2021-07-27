package {

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import utils.collector.Collector;

public class Test_Collector extends Sprite {
    private var clicksCollector:Collector = new Collector();
    private var addCollector:Collector = new Collector();
    
    public function Test_Collector() {
//        Cc.start(this);
//        Cc.visible = true;
        
        clicksCollector.start(stage, MouseEvent.CLICK, 3, clicksCollector_finishedHandler, true);
        
        var numChildren:int = 15;
        addCollector.start(stage, Event.COMPLETE, numChildren / 3, addCollector_finishedHandler, true);
        
        for (var i:int = 0; i < numChildren; i++) {
            addChild(new SomeChild());
        }
    }
    
    private function clicksCollector_finishedHandler(event:* = null):void {
        trace("clicksCollector finished outside");
    }
    
    private function addCollector_finishedHandler(event:* = null):void {
        trace("addCollector finished outside", numChildren);
    }
}
}

import flash.display.Sprite;
import flash.events.Event;

class SomeChild extends Sprite {
    public function SomeChild() {
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }
    
    private function addedToStageHandler(event:Event):void {
        //trace("added");
        dispatchEvent(new Event(Event.COMPLETE, true));
    }
}