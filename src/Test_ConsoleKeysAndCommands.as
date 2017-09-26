package {
	import com.junkbyte.console.Cc;
	import com.junkbyte.console.KeyBind;
	
	import flash.display.Sprite;
	import flash.ui.Keyboard;
	
	[SWF(height=600,width=500)]
public class Test_ConsoleKeysAndCommands extends Sprite {
    public function Test_ConsoleKeysAndCommands() {
//        Cc.start(this);
//        Cc.visible = true;
//        Cc.height = 200;
//        Cc.width = 500;

        Cc.config.commandLineAllowed = true;
        Cc.addSlashCommand("f0", f0);
        Cc.addSlashCommand("f1", f1);
        Cc.addSlashCommand("f2", f2);
        Cc.addSlashCommand("f3", f3);
        Cc.commandLine = true;
        Cc.bindKey(new KeyBind(Keyboard.NUMBER_0), f2, [99,8]);
        Cc.bindKey(new KeyBind(Keyboard.NUMBER_9), toggleConsoleVisibility, []);

        //trace(f2(77,1))
        
        var b1 = new Box();
        b1.y = 250;
        addChild(b1);
	    
	    Cc.warnchw(this);
	    Cc.log(this);
     
    }
		
		private function toggleConsoleVisibility():void {
            Cc.visible = !Cc.visible;
		}

    public function f0():void {
        Cc.log("f0 called", arguments);
    }

    public function f1(value1:int):void {
        Cc.log("f1 called", value1, arguments);
    }

    public function f2(value1:int,value2:String):* {
        Cc.log("f2 called", value1, value2, arguments);
	    Cc.warnchw(this, "sdadfdsf##5555")
        return value1;
    }

    //TODO: add Array
    public function f3(value1:Array):* {
        Cc.log("f3 called", value1, arguments);
        return value1;
    }
}
}

import flash.display.Shape;
import flash.display.Sprite;

import utils.Utils;

class Box extends Sprite{
    private var _shape:Shape;
	public function Box() {
        _shape = Utils.drawBox();
        addChild(_shape);
	}
	
	public function square():Number {
        return 15;
	}
}
