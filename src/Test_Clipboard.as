package {


import com.junkbyte.console.Cc;

import flash.events.FocusEvent;

import flash.system.System;

public class Test_Clipboard extends BaseTest {
    public function Test_Clipboard() {
        Cc.start(this);
        Cc.visible = true;
        Cc.green2cw(this , {a:{b:{C:22}}});
        Cc.config.commandLineAllowed = true;
        
        System.setClipboard("This will be placed in the clipboard");
        
        log("inited");
        
        addEventListener(FocusEvent.FOCUS_IN, focusIn);
        addEventListener(FocusEvent.FOCUS_OUT, focusOut);
        addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChange);
        addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChange);
        
    }
    
    private function focusIn(event:FocusEvent):void {
        trace("focusIn", event.target, event.target.text);
    }
    
    private function focusOut(event:FocusEvent):void {
        trace("focusOut", event.target, event.target.text);
    }
    
    private function keyFocusChange(event:FocusEvent):void {
        trace("keyFocusChange", event.target, event.target.text);
    }
    
    private function mouseFocusChange(event:FocusEvent):void {
        trace("mouseFocusChange", event.target, event.target.text);
    }
}
}
