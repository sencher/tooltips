package {
import com.junkbyte.console.Cc;
import com.junkbyte.console.KeyBind;

import flash.display.Sprite;
import flash.ui.Keyboard;

[SWF(height=800,width=500)]
public class Test_Console extends Sprite {
    public function Test_Console() {
        Cc.start(this);
        Cc.visible = true;
        Cc.height = 800;
        Cc.width = 500;

        Cc.config.commandLineAllowed = true;
        Cc.addSlashCommand("test", returnArg)
        Cc.commandLine = true;
        Cc.bindKey(new KeyBind(Keyboard.NUMBER_0), returnArg, [99]);

        trace(returnArg(77))
    }

    public function returnArg(value:*):* {
        Cc.log("returnArg called", arguments);
        return value;
    }
}
}
