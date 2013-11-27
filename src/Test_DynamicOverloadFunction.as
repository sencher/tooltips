package {
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class Test_DynamicOverloadFunction extends Sprite{
        public static const VISIBLE:String = "visible";
        public var mc:MovieClip;
        public function Test_DynamicOverloadFunction() {
            mc = new MovieClip();
            addChild(mc);
            mc.name = "676767"
            mc.setVisible = function(value:Boolean){
                mc.visible = value;
                trace(this, this.name);
                this.dispatchEvent(new Event(Test_DynamicOverloadFunction.VISIBLE,true,true));
            }
            addEventListener(Test_DynamicOverloadFunction.VISIBLE, onChange);
            addEventListener(Test_DynamicOverloadFunction.VISIBLE, onChange,true);
            stage.addEventListener(MouseEvent.CLICK, onClick)
        }

        private function onClick(event:MouseEvent):void {
            mc.setVisible(!mc.visible);
            trace(mc.visible);
        }

        private function onChange(event:Event):void {
            trace("bal");
        }
    }
}
