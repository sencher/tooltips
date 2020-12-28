package utils.wg.utils.data.binding
{
	import flash.utils.getTimer;
	
	/**
	 * класс можно использовать вместо событий EventDispatcher'a когда нужно произвести реакцию только на сам факт срабатывания чего-то (реакция слота на сигнал) без передачи параметров
	 * Использование:
	 * var signal:Signal=new Signal();
	 * ...
	 * signal.add(mySlot);    //    mySlot - функция обратного вызова, которая должна быть вызвана по сигналу
	 * ...
	 * signal.fire();        //    оповещаяем все зарегестрированные слоты для данного сигнала
	 */
	public class Signal
	{
		protected var _slots:Vector.<Function>;
		
		protected var _debugMessage:String;
		
		public function Signal(debugMessage:String = null)
		{
			_debugMessage = debugMessage;
			_slots = new Vector.<Function>();
		}
		
		/**
		 * добавить слот
		 * @param    slot    -    функция обратного вызова, которая будет вызвана при срабатывании сигнала
		 */
		public function add(slot:Function):void
		{
			if (_slots.indexOf(slot) == -1) {
				_slots[_slots.length] = slot;
			}
		}
		
		public function get amount():uint {
			return _slots.length;
		}
		
		/**
		 * удаляет слот
		 * @param    slot    -    функция обратного вызова, которую нужно убрать со списка слотов данного сигнала
		 */
		public function remove(slot:Function):void
		{
			var index:int = _slots.indexOf(slot);
			if (index != -1) {
				_slots.splice(index, 1);
			}
		}
		
		/**
		 * оповестить все зарегистрированные слоты о срабатывании данного сигнала
		 */
		public function fire(...args):void
		{
			var t:int;
			if (_debugMessage != null) {
				t = getTimer();
			}
			var proc:Vector.<Function> = _slots.slice();
			var count:int = proc.length;
			//	оповещаем все слоты о срабатывании данного сигнала
			for (var i:int = 0; i < count; i++) {
				var slot:Function = proc[i];
				//	если в процессе вызова слотов текущий слот был удален, то не вызываем его
				if (_slots.indexOf(slot) != -1) {
					if (args.length == 0) slot();
					else slot.apply(null, args);
				}
			}
			if (_debugMessage != null) {
				trace("[SIGNAL] ", _debugMessage, count, "slots updated in", getTimer() - t, "ms");
			}
		}
		
		public function dispose():void
		{
			_slots.length = 0;
		}
	}
	
}
