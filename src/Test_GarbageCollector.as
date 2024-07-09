package {

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.LocalConnection;
import flash.system.System;

import utils.Button;

import utils.Utils;

[SWF(frameRate="1")]
public class Test_GarbageCollector extends Sprite{
    public function Test_GarbageCollector() {
        trace(System.totalMemory);
        new Object();
        trace(System.totalMemory);
        var b:* = new Button("forceGC");
        b.addEventListener(MouseEvent.CLICK, forceGC);
        addChild(b);
        
        var c:* = new Button("traceMemory");
        c.addEventListener(MouseEvent.CLICK, traceMemory);
        c.x = b.width;
        addChild(c);
        
        addEventListener(Event.ENTER_FRAME, traceMemory);
    }
    
    private function traceMemory(e:Event = null):void{
        trace(System.totalMemory);
    }
    
    private function forceGC(e:Event = null):void
    {
        trace("before", System.totalMemory);
        try
        {
            new LocalConnection().connect('foo');
            new LocalConnection().connect('foo');
        }
        catch (e:*) { }
        
        // Displays a text in the screen
        trace("----- Garbage collection triggered -----", System.totalMemory);
    }
}
}
