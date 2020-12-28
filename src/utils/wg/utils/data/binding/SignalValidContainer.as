package utils.wg.utils.data.binding
{
	import wowp.utils.array.addOnce;
	
	public class SignalValidContainer
	{
		private var _signals:Vector.<SignalValid> = new <SignalValid>[];
		
		private var _callback:Function;
		
		public function clear():void {
			for each(var sv:SignalValid in _signals) {
				sv.remove(check);
			}
			_signals.length = 0;
			_callback = null;
		}
		
		public function add(signal:SignalValid):void {
			addOnce(_signals, signal);
		}
		
		public function setCallback(func:Function):void {
			for each(var sv:SignalValid in _signals) {
				sv.add(check);
			}
			_callback = func;
			check();
		}
		
		private function check():void {
			if (_callback == null) return;
			for each(var sv:SignalValid in _signals) {
				if (!sv.isValid) return;
			}
			_callback();
		}
	}
	
}
