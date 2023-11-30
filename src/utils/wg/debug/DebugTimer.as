package utils.wg.debug
{
    import flash.utils.getTimer;

    public class DebugTimer
    {
        private var _t:int;
        private var _prefix:String;

        public function DebugTimer(prefix:String="") {
			_prefix = prefix;
            _t = getTimer();
        }

        public function get time():int {
            return getTimer() - _t;
        }

        public function print(value:String = ""):void {
            trace(_prefix, value, time, "ms");
        }
    }
}
