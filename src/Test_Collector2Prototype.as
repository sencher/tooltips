package {

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import utils.Utils;

import utils.collector.Collector;
import utils.collector.Collector2Prototype;

public class Test_Collector2Prototype extends Sprite {
    private var spriteCollector:Collector2Prototype = new Collector2Prototype();
    private var spriteCollector2:Collector2Prototype = new Collector2Prototype();
    private var vector:Vector.<SomeChild> = new Vector.<SomeChild>();
    private const CHILDRENS:int = 5;
    
    public function Test_Collector2Prototype() {
//        Cc.start(this);
//        Cc.visible = true;
        
//        clicksCollector.start(stage, MouseEvent.CLICK, 3, clicksCollector_finishedHandler, true);
//
//        var numChildren:int = 15;
//        addCollector.start(stage, Event.COMPLETE, numChildren / 3, addCollector_finishedHandler, true);
//
        for (var i:int = 0; i < CHILDRENS; i++) {
            var child:SomeChild = new SomeChild();
            child.name = "c" + (i+1);
            vector.push(child);
            spriteCollector.addSource(child);
        }
        trace(spriteCollector);
        
        spriteCollector.start(Event.COMPLETE, spriteCollector_finishedHandler);
        
        var resetButton:Sprite = Utils.createButton();
        resetButton.addEventListener(MouseEvent.CLICK, resetButton_clickHandler);
        addChild(resetButton);
        
        var sendButton:Sprite = Utils.createButton(100);
        sendButton.addEventListener(MouseEvent.CLICK, sendButton_clickHandler);
        addChild(sendButton);
        
        //********************
        
        spriteCollector2.addPackageAndStart(vector, Event.COMPLETE, spriteCollector2_finishedHandler);
        
        var resetButton2:Sprite = Utils.createButton(0,100);
        resetButton2.addEventListener(MouseEvent.CLICK, resetButton2_clickHandler);
        addChild(resetButton2);
        
//        var sendButton2:Sprite = Utils.createButton(100,100);
//        sendButton2.addEventListener(MouseEvent.CLICK, sendButton2_clickHandler);
//        addChild(sendButton2);
    }
    
    private function resetButton2_clickHandler(event:MouseEvent):void {
        trace("reset2");
        spriteCollector2.addPackageAndStart(vector, Event.COMPLETE, spriteCollector2_finishedHandler);
    }
    
//    private function sendButton2_clickHandler(event:MouseEvent):void {
//        vector[Utils.getRandom(0, CHILDRENS-1)].sendEvent();
//        trace(spriteCollector);
//    }
    
    private function resetButton_clickHandler(event:MouseEvent):void {
        trace("reset");
        spriteCollector.dispose();
        for each (var someChild:SomeChild in vector){
            spriteCollector.addSource(someChild);
        }
        spriteCollector.start(Event.COMPLETE, spriteCollector_finishedHandler);
    }
    
    private function sendButton_clickHandler(event:MouseEvent):void {
        vector[Utils.getRandom(0, CHILDRENS-1)].sendEvent();
        trace(spriteCollector);
    }
    
    private function spriteCollector_finishedHandler(event:* = null):void {
        trace("spriteCollector finished");
        trace(spriteCollector);
    }
    
    private function spriteCollector2_finishedHandler(event:* = null):void {
        trace("spriteCollector2 finished");
        trace(spriteCollector2);
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