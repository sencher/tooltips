package {
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;

    [SWF(backgroundColor="0x888844")]
    public class Test_9Slice extends Sprite {
        private var b:bubble = new bubble();
        private const STEP:Number = 10;

        public function Test_9Slice() {

            addChild(b);
            b.x = b.y = 150;
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        }

        private function onKeyUp(event:KeyboardEvent):void {
//            var shift:Boolean = event.shiftKey;
            switch (event.keyCode)
            {
                case Keyboard.LEFT:
                    b.width -= STEP;
                    break;
                case Keyboard.RIGHT:
                    b.width += STEP;
                    break;
                case Keyboard.UP:
                    b.height -= STEP;
                    break;
                case Keyboard.DOWN:
                    b.height += STEP;
                    break;

            }
        }
    }
}
