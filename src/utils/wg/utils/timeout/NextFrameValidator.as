package utils.wg.utils.timeout
{
	import wowp.utils.enterFrame.EnterFrameDispatcher;
	import wowp.utils.enterFrame.IEnterFrameHandler;
	
	public class NextFrameValidator implements IValidator, IEnterFrameHandler
	{
		private var _validateCallback:Function;
		private var _validateArgs:Array;
		private var _isInvalid:Boolean;
		private var _framesLeft:int;
		private var _waitFrames:int;
		
		public function get isInvalid():Boolean {return _isInvalid;}
		
		public function NextFrameValidator(validateCallback:Function, waitFrames:int = 1)
		{
			_waitFrames = waitFrames;
			_validateCallback = validateCallback;
		}
		
		public function invalidate(...args):void
		{
			_isInvalid = true;
			_framesLeft = _waitFrames;
			EnterFrameDispatcher.instance.add(this);
			_validateArgs = args;
		}
		
		public function dispose():void
		{
			EnterFrameDispatcher.instance.remove(this);
			_validateCallback = null;
			_validateArgs = null;
		}
		
		public function enterFrameHandler():void
		{
			if (_framesLeft-- > 0) return;
			EnterFrameDispatcher.instance.remove(this);
			_isInvalid = false;
			if (_validateCallback != null) {
				if ((_validateArgs == null) || _validateArgs.length == 0) {
					_validateCallback();
				} else {
					var args:Array = _validateArgs;
					_validateArgs = null;
					_validateCallback.apply(null, args);
				}
			}
		}
		
		public function validateNow():void
		{
			_framesLeft = 0;
			enterFrameHandler();
		}
		
		public function cancel():void {
			EnterFrameDispatcher.instance.remove(this);
			_validateArgs = null;
		}
		
	}
	
}