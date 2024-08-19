package wowp.utils.data.binding
{
	import wowp.utils.timeout.TimeoutValidator;
	
	/**
	 * сигнал, который срабатывает не сразу после вызова функции fire, а после завершения вызова стека вызовов (через timeout 0)
	 */
	
	public class DelayedSignal extends Signal
	{
		private var _validator:TimeoutValidator;
		
		public function DelayedSignal(debugMessage:String = null)
		{
			super(debugMessage);
			_validator = new TimeoutValidator(doFire);
		}
		
		override public function dispose():void
		{
			super.dispose();
			_validator.dispose();
		}
		
		override public function fire(...args):void
		{
			_validator.invalidate(args);
		}
		
		public function fireNowIfInvalid():void {
			if (_validator.isInvalid) {
				_validator.validateNow();
			}
		}
		
		public function fireNow(...args):void {
			fire(args);
			_validator.validateNow();
		}
		
		private function doFire(args:Array):void
		{
			if (args.length == 0) {
				super.fire();
			} else {
				super.fire.apply(null, args);
			}
		}
		
		public function cancel():void {
			_validator.cancel();
		}
	}
	
}