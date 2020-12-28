package utils.wg.utils.timer
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class TimerEx
	{
		private var _timer:Timer;
		private var _callBack:Function;

		private var _isStarted:Boolean;
		public function get isStarted():Boolean {return _isStarted;}

		public function TimerEx(callBack:Function, delay:int = 1000, autoStart:Boolean=true)
		{
			_callBack = callBack;
			_timer = new Timer(delay);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			if(autoStart){
				_timer.start();
				_isStarted = true;
			}
		}

		public function stop():void
		{
			if(_isStarted){
				_isStarted = false;
				_timer.stop();
			}
		}

		public function start():void {
			if(!_isStarted){
				_isStarted = true;
				_timer.start();
			}
		}

		private function onTimer(event:TimerEvent):void
		{
			if (_callBack != null) _callBack();
		}
	}
}
