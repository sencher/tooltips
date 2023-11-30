package utils.wg.timer
{
    import flash.utils.getTimer;
    
    import wowp.utils.data.binding.Signal;
    import wowp.utils.enterFrame.EnterFrameDispatcher;
    import wowp.utils.enterFrame.IEnterFrameHandler;
    
    public class PausableTimer implements IEnterFrameHandler
    {
        public const onTimer:Signal = new Signal();
        
        private var _time:int;
        private var _currentTime:int;
        private var _prevTime:int;
        private var _isStarted:Boolean;
        
        public var isPaused:Boolean;
        public var autoRestart:Boolean;
        
        public function setTime(value:int):void {
            _time = value;
        }
        
        public function enterFrameHandler():void {
            var t:int = getTimer();
            update(t - _prevTime);
            _prevTime = t;
        }
        
        private function update(dt:int):void {
            if (isPaused) return;
            _currentTime += dt;
            if (_currentTime >= _time) {
                _currentTime -= _time;
                onTimer.fire();
                if (!autoRestart) {
                    stop();
                }
            }
        }
        
        public function start(time:int = -1):void {
            if (time != -1) {
                _time = time;
            }
            _currentTime = 0;
            _isStarted = true;
            _prevTime = getTimer();
            EnterFrameDispatcher.instance.add(this);
        }
        
        public function stop():void {
            _isStarted = false;
            EnterFrameDispatcher.instance.remove(this);
        }
    }
}
