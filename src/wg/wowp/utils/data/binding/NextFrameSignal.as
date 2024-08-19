package wowp.utils.data.binding
{
	import wowp.utils.timeout.NextFrameValidator;
	
	public class NextFrameSignal extends Signal
	{
		private var _validator:NextFrameValidator;
		
		public function NextFrameSignal(debugMessage:String = null)
		{
			super(debugMessage);
			_validator = new NextFrameValidator(doFire);
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
