package {

import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import utils.Utils;

import utils.collector.Collector;
import utils.collector.Collector2Prototype;
import utils.collector.CollectorUnique;

public class Test_CollectorUnique extends Sprite {
    private var spriteCollector:CollectorUnique = new CollectorUnique();
    private var vector:Vector.<SomeChild> = new Vector.<SomeChild>();
    private const CHILDRENS:int = 5;
    
    public function Test_CollectorUnique() {
        Cc.start(this);
        Cc.visible = true;
        
        for (var i:int = 0; i < CHILDRENS; i++) {
            var child:SomeChild = new SomeChild();
            child.name = "c" + (i+1);
            vector.push(child);
            addChild(child);
        }
        
        spriteCollector.start(this, Event.COMPLETE, CHILDRENS, spriteCollector_finishedHandler);
        
        var resetButton:Sprite = Utils.createButton();
        resetButton.addEventListener(MouseEvent.CLICK, resetButton_clickHandler);
        addChild(resetButton);
        
        var sendButton:Sprite = Utils.createButton(100);
        sendButton.addEventListener(MouseEvent.CLICK, sendButton_clickHandler);
        addChild(sendButton);
    }
    
    private function resetButton_clickHandler(event:MouseEvent):void {
        trace("reset");
//        spriteCollector.dispose();
//        for each (var someChild:SomeChild in vector){
//            spriteCollector.addSource(someChild);
//        }
//        spriteCollector.start(Event.COMPLETE, spriteCollector_finishedHandler);
    }
    
    private function sendButton_clickHandler(event:MouseEvent):void {
        vector[Utils.getRandom(0, CHILDRENS-1)].sendEvent();
//        trace(spriteCollector);
    }
    
    private function spriteCollector_finishedHandler(event:* = null):void {
        trace("spriteCollector finished");
//        trace(spriteCollector);
    }
}
}

import flash.display.Sprite;
import flash.events.Event;

dynamic class SomeChild extends Sprite {
    public function SomeChild() {
        //addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }
    
    private function addedToStageHandler(event:Event):void {
        //trace("added");
        //dispatchEvent(new Event(Event.COMPLETE, true));
    }
    
    public function sendEvent():void {
        trace(name + " complete");
        dispatchEvent(new Event(Event.COMPLETE, true));
    }
}