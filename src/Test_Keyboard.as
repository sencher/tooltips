package {
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    public class Test_Keyboard extends Sprite{
        public function Test_Keyboard() {
            stage.addEventListener(KeyboardEvent.KEY_DOWN, trEvent)
        }

        private function trEvent(event:KeyboardEvent):void {
            trace(event.keyCode, event.shiftKey, event.ctrlKey, event.altKey, event.charCode, event.keyLocation)

            switch (event.charCode)
            {
                case Keyboard.A:
                    trace("A");
                    break;
                case 97:
                    trace("a");
                    break;
            }
        }
    }
}
