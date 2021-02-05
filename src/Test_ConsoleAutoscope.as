package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.events.TimerEvent;
import flash.utils.Dictionary;
import flash.utils.Timer;

import utils.Utils;

import wowp.account.model.warCache.WarCachePrizeVO;

[SWF(height=200, width=400, backgroundColor="#333333")]
public class Test_ConsoleAutoscope extends Sprite {
    private var counter:int = 500;
    
    public function Test_ConsoleAutoscope() {
        var bg:Sprite = Utils.createButton(0, 0, stage.stageWidth, stage.stageHeight);
        addChild(bg);
        
        Cc.start(stage);
        Cc.commandLine = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.config.alwaysOnTop = false;
        
        Cc.height = stage.stageHeight;
        Cc.width = stage.stageWidth;
        
//        for (var i:int = 0; i < 300; i++) {
//            logIntoRandomChannel(i);
//        }
//			stage.addEventListener(KeyboardEvent.KEY_DOWN, container_keyDownHandler)
//			stage.addEventListener(KeyboardEvent.KEY_UP, container_keyDownHandler)
        Cc.logch(Utils, "init");
        
//        var timer:Timer = new Timer(1000);
//        timer.addEventListener(TimerEvent.TIMER, onTimer);
//        timer.start();
        var a:WarCachePrizeVO = new WarCachePrizeVO({titleLoc:"aaa"})
        var b:WarCachePrizeVO = new WarCachePrizeVO({titleLoc:"bbb"})
        var c:WarCachePrizeVO = new WarCachePrizeVO({titleLoc:"ccc"})
        
    
        var v:Vector.<WarCachePrizeVO> = new Vector.<WarCachePrizeVO>();
        v.push(a);
        v.push(b);
        v.push(c);
        Cc.logchw(this, "vec", v);
        
        
//        var d:Dictionary = new Dictionary();
//        d[a] = b;
//        d[b] = c;
//        d[c] = a;
//
//        Cc.logchw(this, "dic", d);
    }
    
    private function onTimer(event:TimerEvent):void {
        logIntoRandomChannel(counter++);
    }
    
    private function logIntoRandomChannel(value:*):void {
        Cc.logch("c" + Utils.getRandom(5, 8), value, {id: value});
    }
    
    private function container_keyDownHandler(event:KeyboardEvent):void {
        trace("3");
//		if(event.keyCode == Keyboard.QUOTE) {
//			visible = !visible;
//		}
    }
}
}

//class
