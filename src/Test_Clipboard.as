package {


import com.junkbyte.console.Cc;

import flash.system.System;

public class Test_Clipboard extends BaseTest {
    public function Test_Clipboard() {
        Cc.start(this);
        Cc.visible = true;
        Cc.green2cw(this , {a:{b:{C:22}}});
        
        System.setClipboard("This will be placed in the clipboard");
        
        log("initkkkked");
        
    }
}
}
