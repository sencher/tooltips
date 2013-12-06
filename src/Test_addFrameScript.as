package {
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;

    public class Test_addFrameScript extends Sprite{
        private var mc:MovieClip;

        public function Test_addFrameScript() {
            mc = new addFrame();
            setTextFramesScript(mc);

//            addEventListener("a", onA)//3
            mc.addEventListener("a", onA)//2
//            addEventListener("a", onA,true)//1
//            mc.addEventListener("a", onA,true)

//            mc.addEventListener(Event.ENTER_FRAME, onEF)
            addChild(mc);

        }

        private function onEF(event:Event):void {
            trace("onEF "+mc.currentFrame)
        }

        private function onA(event:Event):void {
            trace("onA", event.eventPhase, event.target.currentFrame, event.currentTarget, event.target);
        }

        private function sendEvent():void {
            var ev:Event = new Event("a",true);
            mc.dispatchEvent(ev);
        }

        public function setTextFramesScript(button:MovieClip):void{
            for (var i:int = 0; i< button.framesLoaded; i++)
                button.addFrameScript(i,sendEvent);
        }
    }
}
