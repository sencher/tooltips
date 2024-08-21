package {

import com.junkbyte.console.Cc;

import flash.events.Event;

import utils.Utils;

public class Dev_ConsoleScroll extends BaseTest {
    private var counter:int = 0;
    public function Dev_ConsoleScroll() {
        showConsole();
        addEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }
    
    private function enterFrameHandler(event:Event):void {
        Cc.green2cw(this, ++counter, {value:Utils.getRandom(0,100)});
        if(counter>100){
            removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
    }
}
}
