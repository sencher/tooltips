package utils.wg.display
{
	import flash.display.MovieClip;
	
	import wowp.utils.data.binding.Signal;
	import wowp.utils.data.binding.SignalOnce;
	import wowp.utils.enterFrame.EnterFrameDispatcher;
	import wowp.utils.enterFrame.IEnterFrameHandler;
	
	public class AnimationController implements IEnterFrameHandler
	{
		private const _onFrameReachedOnce:SignalOnce = new SignalOnce();
		public const onFrameReached:Signal = new Signal();
		public const onFrameChanged:Signal = new Signal();
		
		private var _mc:MovieClip;
		private var _direction:int;
		private var _destination:int = -1;
		
		public function get frame():int {return _mc.currentFrame;}
		
		public function AnimationController(mc:MovieClip) {
			_mc = mc;
			_mc.stop();
		}
		
		public function dispose():void {
			stop();
			_onFrameReachedOnce.dispose();
			_mc = null;
		}
		
		public function playTo(frame:int, onFrameReached:Function = null):void {
			_destination = frame;
			_direction = _destination > _mc.currentFrame ? 1 : -1;
			_onFrameReachedOnce.dispose();
			if (onFrameReached != null) {
				_onFrameReachedOnce.add(onFrameReached);
			}
			EnterFrameDispatcher.instance.add(this);
		}
		
		public function stop():void {
			_destination = -1;
			EnterFrameDispatcher.instance.remove(this);
		}
		
		public function enterFrameHandler():void {
			if (_direction > 0) {
				_mc.nextFrame();
			} else {
				_mc.prevFrame();
			}
			
			onFrameChanged.fire();
			
			if (_destination == _mc.currentFrame) {
				stop();
				onFrameReached.fire();
				_onFrameReachedOnce.fire();
			}
		}
	}
}
