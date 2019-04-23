package {
import com.junkbyte.console.Cc;
import com.junkbyte.console.KeyBind;
	
	import composition.A;
	
	import flash.display.Sprite;
import flash.ui.Keyboard;

import utils.Utils;

[SWF(height=600,width=500)]
public class Test_ConsoleChannels extends Sprite {
    public function Test_ConsoleChannels() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 600;
        Cc.width = 500;
        

//        Cc.log("init");
//        var i:int;
//        for (i=0; i<100; i++){
//            Cc.logch("window"+Utils.getRandom(1,10), Utils.generateRandomString(Utils.getRandom(3,16)));
//        }
//        Cc.log("end");
//
//        Cc.ch("window2", "CUSTOM");
//        Cc.ch(this, "CUSTOM2");
	
	    Cc.config.tracing = true;
     
        Cc.log("log");
        Cc.logch("logch", "logch");
        Cc.logchw(this, "logchw", "logchw");
        Cc.warn("warn");
        Cc.warnch("warnch", "warnch");
	    Cc.warnchw(this, "warnchw", "warnchw");
     //        var s:String = "<menu><a href='event:ref_1'>[Stack]</a></menu> warnchw";
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
    }
	
	private function f1():void {
		f2();
	}
	
	private function f2():void {
		Cc.warnchw("warnchw","warnchw2");
	}
}
}
