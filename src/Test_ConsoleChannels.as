package {
import com.junkbyte.console.Cc;
import com.junkbyte.console.KeyBind;

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

        Cc.log("init");
        var i:int;
        for (i=0; i<100; i++){
            Cc.logch("window"+Utils.getRandom(1,10), Utils.generateRandomString(Utils.getRandom(3,16)));
        }
        Cc.log("end");

        Cc.ch("window2", "CUSTOM");
        Cc.ch(this, "CUSTOM2");
    }
}
}
