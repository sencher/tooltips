package {

import com.greensock.TweenLite;
import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.events.Event;

import utils.Utils;

[SWF(height=600,width=500,frameRate=60)]
public class Test_ConsoleChannels extends Sprite {
    private var counter:int;
    
    public function Test_ConsoleChannels() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 600;
        Cc.width = 500;
        Cc.config.tracingLevel = 1;

        Cc.log("init");
        var i:int;
        for (i=0; i<500; i++){
            addRandomLineInRandonChannel();
        }
        Cc.log("end");

        Cc.ch("window2", "CUSTOM");
        Cc.ch(this, "CUSTOM2");
	
//	    Cc.config.tracing = true;
     
        Cc.log("log");
        Cc.logc("logch", "logch");
        Cc.logcw(this, "logchw", "logchw");
        Cc.warn("warn");
        Cc.warnc("warnch", "warnch");
	    Cc.warncw(this, "warnchw", "warnchw");
     
//      var s:String = "<menu><a href='event:ref_1'>[Stack]</a></menu> warnchw";
//	    var pattern:RegExp = /event:.*_(.*)'/g;
//	    var linkId:int = s.match(pattern)[0].replace(pattern, "$1");
//        trace(linkId);
//
//	    linkId = s.match(pattern)[0].replace(pattern, "$1");
//	    trace(linkId);
//	    var l:Array = s.match(pattern);
//        var l2:String = l[0].replace(pattern, "$1");
//	//trace(l2);
//        var q:String = s.replace(pattern, "$1");
//	    var stack:String = "****\n111\n222";
//	    var pattern2:RegExp = /<.*>/g;
//        var result:String = s.replace(/<.*>/g);
//        result += "\n" + stack;
        //trace(result)
        f1();
    
        resetDelay();
    }
    
    private function resetDelay():void {
        TweenLite.delayedCall(30,resetDelay,null, true);
        addRandomLineInRandonChannel();
    }
	
	private function f1():void {
		f2();
	}
	
	private function f2():void {
		Cc.warncw("warnchw","warnchw2");
	}
    
    private function addRandomLineInRandonChannel(event:Event = null):void{
        Cc.logc("window"+Utils.getRandom(1,3), ++counter, {s: Utils.generateRandomString(Utils.getRandom(3,16))});
    }
}
}
