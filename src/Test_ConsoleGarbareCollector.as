package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;

public class Test_ConsoleGarbareCollector extends Sprite {
    public function Test_ConsoleGarbareCollector() {
        Cc.start(stage);
        Cc.commandLine = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
//			Cc.config.alwaysOnTop = false;
        Cc.visible = true;
        //Cc.x = Cc.y = 500;
        Cc.width = 300;
        Cc.height = 500;
    
        func();
    }
    
    private function func():void {
        Cc.logchwj("ch", {a:1},{b:2},{c:3},{d:4},{e:5},{f:6},{g:7})
    }
}
}
