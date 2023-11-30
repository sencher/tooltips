package utils.wg.display
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.events.Event;

	/**
	 * Когда DisplayObject уберается с экрана изза ключевого кадра в анимации на таймлайне, то не всегда срабатывает
	 * ивент REMOVED_FROM_STAGE. Данная утилита должна помочь в таких ситуациях
	 */
	public class ScaleFormRemovedFromStageWatcher
	{
		private static const _shape:Shape = new Shape();
		private static const _d:Vector.<DisplayObject> = new <DisplayObject>[];
		
		public static function watch(d:DisplayObject):void {
			var index:int = _d.indexOf(d);
			if (index == -1) {
				_d[_d.length] = d;
				if (_d.length == 1) {
					_shape.addEventListener(Event.ENTER_FRAME, enterFrameHandler, false, int.MIN_VALUE);
				}
			}
		}

		public static function unwatch(d:DisplayObject):void {
			var index:int = _d.indexOf(d);
			if (index != -1) {
				_d[index] = null;
			}
		}

		private static function enterFrameHandler(e:Event):void {
			var len:int = _d.length;
			var i:int = 0;

			while (i < len) {
				var d:DisplayObject = _d[i];
				if (d) {
					if (d.stage == null) {
						d.dispatchEvent(new Event(Event.REMOVED_FROM_STAGE));
					}
					i++;
				} else {
					if (i == len - 1) {
						_d.pop();
					} else {
						_d[i] = _d.pop();
					}
					len--;
					if (len == 0) {
						_shape.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
					}
				}
			}
		}
	}
}
