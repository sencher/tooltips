package {
    import flash.display.Sprite;
    import flash.events.Event;

    public class Test_EventDispatcher extends Sprite {

        public function Test_EventDispatcher() {
            var dispatcher:CustomDispatcher = new CustomDispatcher();
            dispatcher.addEventListener(CustomDispatcher.ACTION, actionHandler);
            dispatcher.doAction();
        }

        private function actionHandler(event:Event):void {
            trace("actionHandler: " + event);
        }
    }
}

import flash.events.EventDispatcher;
import flash.events.Event;

class CustomDispatcher extends EventDispatcher {
    public static var ACTION:String = "action";

    public function doAction():void {
        dispatchEvent(new Event(CustomDispatcher.ACTION));
    }
}