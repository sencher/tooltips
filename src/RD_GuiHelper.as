package {
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import utils.GuiHelper;
    import utils.Utils;

    public class RD_GuiHelper extends Sprite{
        private var bclose1:close = new close();
        private var bclose2:close = new close();
        private var bclose3:close = new close();
        private var bbut:but = new but();
        private var counter:int = 1;

        public function RD_GuiHelper() {
//            initBut(bclose1)
//            bclose1.gotoAndStop(4);
//            initBut(bclose2,false)
//            initBut(bclose3)
//            GuiHelper.enable(bclose3,false)

//            addChild(bbut)
//            bbut.y = 50;
        }

        private function initBut(mc:MovieClip,en:Boolean = true):void
        {
//            mc.addEventListener("a", frameChanged)//2
            addChild(mc);
            mc.y = counter*50;
            mc.name = String(counter++);
            GuiHelper.set_4frames_button(mc,Utils.trEvent,en);

            mc.addEventListener(MouseEvent.RIGHT_CLICK, onRight)

        }

        private function onRight(event:MouseEvent):void {
            var curTarget:MovieClip = MovieClip(event.currentTarget);
            GuiHelper.enable(curTarget, !curTarget.enabled);
        }

        private static function frameChanged(event:Event):void {
            trace("frameChanged", event.target.currentFrame, event.currentTarget.name, event.currentTarget, event.target);
        }
    }
}
