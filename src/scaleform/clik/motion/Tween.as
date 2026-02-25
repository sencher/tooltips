package scaleform.clik.motion
{
	public class Tween implements ITween
	{
		private var _tween:ITween;
		
		public function Tween(duration:Number, target:Object = null, finishProps:Object = null,
							  quickSet:Object = null)
		{
			if (TweenGlobalSettings.isScaleForm) {
				_tween = new ExternalTween(this, duration, target, finishProps, quickSet);
			} else {
				_tween = new FlashTween(this, duration, target, finishProps, quickSet);
			}
		}
		
		public function get position():Number {
			return _tween.position;
		}
		
		public function get paused():Boolean {
			return _tween.paused;
		}
		
		public function set paused(value:Boolean):void {
			if (_tween) _tween.paused = value;
		}
		
		public function doAutoDispose():void {
			if (_tween) _tween.doAutoDispose();
		}
		
		public function get target():Object {
			return _tween ? _tween.target : null;
		}
		
		public function set target(value:Object):void {
			if (_tween) _tween.target = value;
		}
		
		public function get data():Object {
			return _tween ? _tween.data : 0;
		}
		
		public function set data(value:Object):void {
			if (_tween) _tween.data = value;
		}
		
		public function dispose():void {
			_tween = null;
		}
		
		public static function removeAllTweens():void {
			FlashTween.removeAllTweens();
			ExternalTween.removeAllTweens();
		}
	}
}
