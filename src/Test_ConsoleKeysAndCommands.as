package {
import com.junkbyte.console.Cc;
import com.junkbyte.console.KeyBind;

import flash.display.Sprite;
import flash.ui.Keyboard;

[SWF(height=600,width=500)]
public class Test_ConsoleKeysAndCommands extends Sprite {
    public function Test_ConsoleKeysAndCommands() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 600;
        Cc.width = 500;

        Cc.config.commandLineAllowed = true;
        Cc.addSlashCommand("f0", f0);
        Cc.addSlashCommand("f1", f1);
        Cc.addSlashCommand("f2", f2);
        Cc.addSlashCommand("f3", f3);
        Cc.commandLine = true;
        Cc.bindKey(new KeyBind(Keyboard.NUMBER_0), f2, [99,8]);

        //trace(f2(77,1))
    }

    public function f0():void {
        Cc.log("f0 called", arguments);
    }

    public function f1(value1:int):void {
        Cc.log("f1 called", value1, arguments);
    }

    public function f2(value1:int,value2:String):* {
        Cc.log("f2 called", value1, value2, arguments);
        return value1;
    }

    public function f3(value1:Array):* {
        Cc.log("f3 called", value1, arguments);
        return value1;
    }
}
}
