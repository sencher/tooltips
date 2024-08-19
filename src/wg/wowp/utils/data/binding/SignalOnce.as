package wowp.utils.data.binding
{
	import flash.utils.getTimer;
	
	public class SignalOnce extends Signal
	{
		public function SignalOnce(debugMessage:String = null) {
			super(debugMessage);
		}
		
		override public function fire(...args):void {
			var t:int;
			if (_debugMessage != null) {
				t = getTimer();
			}
			var proc:Vector.<Function> = _slots.slice();
			_slots.length = 0;
			var count:int = proc.length;
			for (var i:int = 0; i < count; i++) {
				if (args.length == 0) proc[i]();
				else proc[i].apply(null, args);
			}
			if (_debugMessage != null) {
				trace("[SIGNAL] ", _debugMessage, count, "slots updated in", getTimer() - t, "ms");
			}
		}
	}
}
