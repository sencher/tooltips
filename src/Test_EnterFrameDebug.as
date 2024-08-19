package {

import com.greensock.TweenLite;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Sprite;
import flash.events.Event;
import flash.system.System;

[SWF(frameRate="3")]
public class Test_EnterFrameDebug extends BaseTest {
    private const START_DELAY:int = 8;
    
    private var mc1:EnterFramableClip = new EnterFramableClip();
    //private var mc2:EnterFramableClip = new EnterFramableClip();
    private var mc3:EnterFramableClip = new EnterFramableClip();
    private var mc4:EnterFramableClip = new EnterFramableClip();
    
    private var counter:int = 0;
    private const UNLOAD_FRAME:int = 12;
    
    public function Test_EnterFrameDebug() {
        //cause for 8 seconds lag on start all timers doesn`t respond.
        TweenLite.delayedCall(START_DELAY, init);
    }
    
    private function init():void {
        addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        
        mc1.name = "mc1";
        createAndAddChild(mc1,"c1");
        createAndAddChild(mc1,"c2");
        createAndAddChild(mc1,"c3");
        
        //mc2.name = "mc2";
        mc3.name = "mc3";
        mc4.name = "mc4";
    
        InnerUtil.addEnterFrame(mc3);
        InnerUtil.addEnterFrame(mc4);
        
        //anonimous
        var a1:Sprite = new Sprite();
        a1.name = "a1";
        InnerUtil.addEnterFrame(a1);
        InnerUtil.dispose(a1);
    
        new Sprite().addEventListener(
                Event.ENTER_FRAME,
                function (event:Event = null) {
                    trace("*" + event.target.name);
                }
        );
    }
    
    private function enterFrameHandler(event:Event):void {
        counter++;
        trace("Application frame:", counter);
        
        if(counter == 16){
            trace("mc1 = null");
            mc1 = null;
        }
        
        if(counter % UNLOAD_FRAME == 0){
            trace("BOOM!");
            //removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
            InnerUtil.dispose(mc4);
            mc4 = null;
            System.gc();
            System.gc();
        }
    }
    
    private function createAndAddChild(par:Sprite, name:String):void {
        var sprite:Sprite = createSpiteWithName(name);
        sprite.addEventListener(Event.ENTER_FRAME, traceEveryFrame);
        par.addChild(sprite);
    }
    
    private function traceEveryFrame(event:Event):void {
        trace(">" + event.target.name);
    }
}
}

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;

class EnterFramableClip extends MovieClip{
    public function EnterFramableClip():void {
        //addEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }
    
    private function enterFrameHandler(event:Event):void {
        trace(event.target.name, event.currentTarget.name);
    }
}

class InnerUtil{
    private static const ENTER_FRAME_LIMIT:int = 5;
    private static var dictionary:Dictionary = new Dictionary();
    
    public function InnerUtil():void {
    
    }
    
    public static function addEnterFrame(value:Sprite):void {
        dictionary[value] = 0;
        value.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }
    
    public static function dispose(value:Sprite):void {
        delete dictionary[value];
    }
    
    private static function enterFrameHandler(event:Event = null):void {
        var target:* = event.target;
        
        if(dictionary[target] == null){
            trace("---" + event.target.name);
            return;
        }
        
        if (++dictionary[target] >= ENTER_FRAME_LIMIT) {
            dictionary[target] = 0;
            trace(event.target.name);
        }
    }
}
