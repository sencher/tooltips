package {
import com.junkbyte.console.Cc;
import com.junkbyte.console.KeyBind;

import flash.display.Sprite;
import flash.ui.Keyboard;

//	import scaleform.gfx.Extensions;

[SWF(height=600, width=500)]
public class Test_ConsoleKeysAndCommands extends Sprite {
    public var box:Box = new Box();

    public function Test_ConsoleKeysAndCommands() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 200;
        Cc.width = 500;

        Cc.commandLine = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.addSlashCommand("f0", f0);
        Cc.addSlashCommand("f1", f1);
        Cc.addSlashCommand("f2", f2);
        Cc.addSlashCommand("f3", f3);
        Cc.bindKey(new KeyBind(Keyboard.NUMBER_0), f2, [99, 8]);
        Cc.bindKey(new KeyBind(Keyboard.NUMBER_9), toggleConsoleVisibility, []);
        //Cc.setRollerCaptureKey("0");

        //trace(f2(77,1))
        //trace(Extensions.isGFxPlayer);

        box.y = 250;
        addChild(box);

        Cc.warncw(this);
        Cc.green2(this);

        var str:String = "this";
        var str2:String = str.replace(/\s*(.*)/, "$1");
        var str3:String = str.replace(/\s*(.*?)\s*/, "$1");
        trace(str, str2, str3);

        var b:String = "     aaa     bbb    ccc ddd";
        var b1:String = b.replace(/\s*(.*)/, "$1");
        trace(b1);

        var mc:Test_SwcUsage = new Test_SwcUsage();
        addChild(mc);
    }

    private function toggleConsoleVisibility():void {
        Cc.visible = !Cc.visible;
    }

    public function f0():void {
        Cc.green2("f0 called", arguments);
        Cc.green2("f0 called", Cc.DEBUG_MODE);
    }

    public function f1(value1:int):void {
        Cc.green2("f1 called", value1, arguments);
    }

    public function f2(value1:int, value2:String):* {
        Cc.green2("f2 called", value1, value2, arguments);
        Cc.warncw(this, "sdadfdsf##5555")
        return value1;
    }

    //TODO: add Array
    public function f3(value1:Array):* {
        Cc.green2("f3 called", value1, arguments);
        return value1;
    }
}
}

import flash.display.Shape;
import flash.display.Sprite;

import utils.Utils;

class Box extends Sprite {
    private var _shape:Shape;

    public function Box() {
        _shape = Utils.createBox();
        addChild(_shape);
    }

    public function square():Number {
        return 15;
    }
}
