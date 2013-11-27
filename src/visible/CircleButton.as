package visible {
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import mx.binding.utils.BindingUtils;

    public class CircleButton extends Sprite {

        [Bindable(event="myOnChangeEvent")]

        [Bindable]
        public var on:Boolean;

        public function CircleButton() {
            this.width = 20;
            this.height = 20;

            graphics.beginFill(0xff6600, 1);
            graphics.drawCircle(width / 2, height / 2, width / 2);
            graphics.endFill();

//            this.addEventListener(MouseEvent.ROLL_OVER, rollover);
//            this.addEventListener(MouseEvent.ROLL_OUT, rollout);

//            this.addEventListener('onChange', onOnChange);
//            this.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onOnChange);
        }

        private function onOnChange(event:Event):void {
            trace("bla")
        }
    }
}
