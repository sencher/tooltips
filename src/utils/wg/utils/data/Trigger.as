package utils.wg.utils.data
{
	import wowp.utils.data.binding.Signal;
	
	public class Trigger 
	{
		/**
		 * Класс-триггер, который срабатывает когда выполняются все условия. Условия передаются при конструировании объекта.
		 * Выполнение условий происходит путем передачи соответсвующих констант или объектов в функцию trigger. Когда все условия будут переданы в эту функцию, 
		 * сработает триггер - сигнал onTrigger
		 * 
		 * Триггер можно использовать когда нужно запустить функцию после выполнения разнесенных во времени условий.
		 * 
		 */
		
		/**
		 * срабатывает когда все условия выполнены
		 */
		public const onTrigger:Signal = new Signal();
		
		private var _flags:Array = [];
		private var _currentFlags:Array = [];
		/**
		 * список еще не сработавших флагов
		 */
		public function get flags():Array { return _currentFlags.slice(); }
		
		/**
		 * в конструктор нужно передать условия
		 * @param	...args
		 */
		public function Trigger(...args) 
		{
			init.apply(null, args);
		}
		
		/**
		 * инициализирует тригер условиями
		 * @param	...args
		 */
		public function init(...args):void
		{
			_flags = args;
			reset();
		}
		
		/**
		 * сброс триггера
		 */
		public function reset():void
		{
			_currentFlags = _flags.slice();
		}
		
		/**
		 * Срабатывание условий. Если все условия, которые были переданы в конструктор объекта были выполнены, то сработает сигнал onTrigger
		 * @param	...args
		 */
		public function trigger(...args):void
		{
			for each(var flag:Object in args)
			{
				var index:int = _currentFlags.indexOf(flag);
				if (index != -1)
				{
					_currentFlags.splice(index, 1);
				}
			}
			
			if (_currentFlags.length == 0)
			{
				onTrigger.fire();
			}
		}
	}

}