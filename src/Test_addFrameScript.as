package {
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;

    public class Test_addFrameScript extends Sprite{
        private var mc1:MovieClip;
        private var mc2:MovieClip;

        public function Test_addFrameScript() {
            mc1 = new addFrame();
            mc2 = new addFrame();
            mc1.name = "mc1";
            mc2.name = "mc2";

//            addEventListener("a", onA)//3
            mc1.addEventListener("a", onA)//2
            mc2.addEventListener("a", onA)//2
//            addEventListener("a", onA,true)//1
//            mc1.addEventListener("a", onA,true)


            setTextFramesScript(mc1);
            setTextFramesScript(mc2);
            addChild(mc1);
            addChild(mc2);

//            mc1.addEventListener(Event.ENTER_FRAME, onEF)
        }

//        private function onEF(event:Event):void {
//            var curTar:MovieClip = MovieClip(event.currentTarget);
//            trace("onEF", curTar.name, curTar.currentFrame);
//        }

        private function onA(event:Event):void {
            var tar:* = event.target;
            trace("onA", tar.name, tar.currentFrame);
//            trace("onA", event.eventPhase, event.target.currentFrame, event.currentTarget, event.target);
        }

        private function sendEvent(button:MovieClip):void {
            var ev:Event = new Event("a",true);
            button.dispatchEvent(ev);
        }

        public function setTextFramesScript(button:MovieClip):void{
            for (var i:int = 0; i< button.framesLoaded; i+=5)
                button.addFrameScript(i,function():void{sendEvent(button)});
        }
    }
}
