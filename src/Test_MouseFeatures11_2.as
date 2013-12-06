package {
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import utils.Utils;

    public class Test_MouseFeatures11_2 extends Sprite{
        public function Test_MouseFeatures11_2() {
            stage.addEventListener(MouseEvent.CLICK, Utils.trEvent);
            stage.addEventListener(MouseEvent.DOUBLE_CLICK, Utils.trEvent);

            stage.addEventListener(MouseEvent.MIDDLE_CLICK, Utils.trEvent);

            stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, Utils.trEvent);
            stage.addEventListener(MouseEvent.CONTEXT_MENU, Utils.trEvent);
            stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, Utils.trEvent);
            stage.addEventListener(MouseEvent.RIGHT_CLICK, Utils.trEvent);

            stage.doubleClickEnabled = true;
        }
    }
}
