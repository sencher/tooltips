package utils.wg.utils.data.sorting
{
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	import wowp.utils.data.binding.Signal;
	
	
	public class SortingManager 
	{
		/**
		 * сигнал того, что сортировка была произведена
		 */
		public const onSorted:Signal = new Signal();
		
		private var _array:Array = [];
		
		public var verbose:Boolean = false;
		
		private var _isActive:Boolean = true;
		
		public function get isActive():Boolean { return _isActive; }
		public function set isActive(value:Boolean):void { _isActive = value; }
		/**
		 * массив который сортируется
		 */
		public function get array():Array { return _array; }
		public function set array(value:Array):void
		{ 
			_array = value; 
			invalidate();
		}
		
		private var _sortingCriterias:Object;
		private var _sortingIDs:Array;
		
		private var _sortingTimeoutID:uint;
		
		/**
		 * сортировка по умолчанию (если больше никакая не указана)
		 */
		public var defaultSortingID:String = null;
		
		public function SortingManager() 
		{
			_sortingCriterias = { };
			_sortingIDs = [];
		}
		
		public function dispose():void
		{
			clearTimeout(_sortingTimeoutID);
			_sortingCriterias = { };
			_sortingIDs = [];
		}
		
		public function invalidate():void
		{
			if (_isActive)
			{
				clearTimeout(_sortingTimeoutID);
				_sortingTimeoutID = setTimeout(validate, 1);
			}
		}
		
		public function validateNow():void
		{
			clearTimeout(_sortingTimeoutID);
			validate();
		}
		
		private function validate():void
		{
			if(verbose)var t:int = getTimer();
			var i:int = 0;
			var len:int = _sortingIDs.length;
			if (len > 0)
			{
				for (i; i < len; ++i)
				{
					doSort(_sortingCriterias[_sortingIDs[i]]);
					
				}
			}
			else
			{
				doSort(_sortingCriterias[defaultSortingID])
			}
			if(verbose)trace("Sorted in", int(getTimer() - t).toString(), "ms");
			onSorted.fire();
		}
		
		private function doSort(arr:Array):void
		{
			if (arr)
			{
				if (arr[0] is Function)
				{
					_array = _array.sort.apply(null, arr);
				}
				else
				{
					_array = _array.sortOn.apply(null, arr);
				}
			}
		}
		
		/**
		 * регистрирует функцию сортировки
		 * @param	sortingID			- айди сортировки
		 * @param	sortingCreteria		- критерий сортировки, параметр, который можно отправлять в функцию Array.sort, если передается несколько аргументов, и первый аргумент - строка, то 
		 * 								выполняется сортировка с помощью метода Array.sortOn
		 */
		public function registerSorting(sortingID:String, ...sortingCreteria):void
		{
			_sortingCriterias[sortingID] = sortingCreteria;
		}
		
		/**
		 * добавляет сортировку в начало приоритета
		 * @param	sortingID			- айди сортировки
		 */
		public function addSorting(sortingID:String):void
		{
			if (!hasSorting(sortingID))
			{
				_sortingIDs[_sortingIDs.length] = sortingID;
			}
			invalidate();
		}
		
		/**
		 * удаляет сортировку
		 * @param	sortingID			- айди сортировки
		 */
		public function removeSorting(sortingID:String):void
		{
			var i:int = _sortingIDs.indexOf(sortingID);
			if (i != -1)
			{
				_sortingIDs.splice(i, 1);
			}
			invalidate();
		}
		
		/**
		 * добавлена ли сортировка 
		 * @param	sortingID			- айди сортировки
		 * @return
		 */
		public function hasSorting(sortingID:String):Boolean
		{
			return _sortingIDs.indexOf(sortingID) != -1;
		}
		
		/**
		 * убирает все сортировки
		 */
		public function clear():void
		{
			_sortingIDs = [];
		}
	}

}