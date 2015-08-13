/**
 * Created by SenCheR on 07.08.2015.
 */
package {
import flash.display.Sprite;
import flash.events.Event;

public class Test_Close extends Sprite {
    public function Test_Close() {
        trace("start")
        root.loaderInfo.addEventListener(flash.events.Event.UNLOAD, unloadHandler);
        root.addEventListener(flash.events.Event.REMOVED_FROM_STAGE, onRem);
    }


    private function unloadHandler(event:flash.events.Event):void {
        trace("unload!")
    }

    private function onRem(event:flash.events.Event):void {
        trace("REMOVED!")
    }
}
}
