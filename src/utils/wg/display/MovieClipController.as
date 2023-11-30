package utils.wg.display
{
    import flash.display.MovieClip;
    import flash.events.Event;
    
    import wowp.utils.data.binding.Signal;
    
    public class MovieClipController
    {
        public const onLabelReached:Signal = new Signal();
        
        private var _mc:MovieClip;
        private var _playToLabel:String;
        private var _playForward:Boolean;
        
        private var _isPlaying:Boolean = false;
        
        public function get isPlaying():Boolean {
            return _isPlaying;
        }
        
        public function MovieClipController(mc:MovieClip = null) {
            setMovieClip(mc);
        }
        
        public function setMovieClip(mc:MovieClip = null):void {
            if (_mc) {
                stop();
            }
            _mc = mc;
            if (_mc) {
                _mc.stop();
            }
        }
        
        public function dispose():void {
            stop();
            _mc = null;
        }
        
        public function playTo(label:String, forward:Boolean):void {
            if (_mc.currentFrameLabel != label) {
                _playToLabel = label;
                _playForward = forward;
                _isPlaying = true;
                _mc.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
            }
        }
        
        public function stop():void {
            _mc.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
            _isPlaying = false;
        }
        
        private function enterFrameHandler(e:Event):void {
            if (_playForward) {
                _mc.nextFrame();
            } else {
                _mc.prevFrame();
            }
            if (_mc.currentFrameLabel == _playToLabel) {
                stop();
                onLabelReached.fire();
            }
        }
    }
}
