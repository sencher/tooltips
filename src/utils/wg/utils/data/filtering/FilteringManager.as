package utils.wg.utils.data.filtering
{
	import flash.utils.getTimer;
	
	import wowp.utils.data.binding.Signal;
	import wowp.utils.timeout.IValidator;
	import wowp.utils.timeout.TimeoutValidator;
	
	public class FilteringManager
	{
		private var _validator:IValidator;
		//	сигнал изменения массива
		public var onFiltered:Signal = new Signal();
		//	список выбраных фильтров
		private var _filters:Array;
		//	список выбраных функций фильтрации
		private var _filterFunctions:Array;
		//	критерии фильтрации
		private var _criterias:Object;
		//	критерии фильтрации, которые отключаются при установке фильтра
		private var _revertedCreterias:Object;
		//	айди таймаута валидации
		private var _validationTimoutID:uint;
		//	исходный массив
		private var _source:Array = [];
		//	отфильтрованый массив
		private var _filtered:Array;
		
		public var verbose:Boolean = false;
		
		private var _isActive:Boolean = true;
		
		public function get source():Array { return _source; }
		
		public function get isActive():Boolean { return _isActive; }
		
		public function set isActive(value:Boolean):void { _isActive = value; }
		
		/**
		 * возвращяет список айдишек ранее зарегистрированых функций фильтраций
		 * @return
		 */
		public function getFilterIDs():Array
		{
			var filters:Array = [];
			for (var s:String in _criterias) {
				if (filters.indexOf(s) == -1) {
					filters[filters.length] = s;
				}
			}
			for (s in _revertedCreterias) {
				if (filters.indexOf(s) == -1) {
					filters[filters.length] = s;
				}
			}
			return filters;
		}
		
		/**
		 * устанавливает исходный массив
		 * @param    arr
		 */
		public function setSourceArray(arr:Array):void
		{
			_source = arr;
			invalidate();
		}
		
		/**
		 * возвращяет отфильтровнаый массив
		 * @return
		 */
		public function getFilteredArray():Array
		{
			return _filtered;
		}
		
		public function FilteringManager()
		{
			_validator = new TimeoutValidator(validate);
			
			_filters = [];
			_criterias = {};
			_filterFunctions = [];
			_revertedCreterias = {};
		}
		
		public function dispose():void
		{
			_filters = [];
			_criterias = {};
			_filterFunctions = [];
			_revertedCreterias = {};
			
			_validator.dispose();
		}
		
		/**
		 * регистрирует функцию фильтрации. Если функция возвращяет true то элемент войдет в фильтрацию. Все функции зарегистрированные посредством этой функции работают по формуле логического И,
		 * т.е. если все функции вернут true только тогда элемент войдет в фильтрацию
		 * @param    filterID            - айди фильтра
		 * @param    filterFunction        - функция, которая должна принимать один аргумент и возвращать Boolean (критерий фильтрации, если тру, то элемент входит в фильтрацию)
		 * @param    revert                - флаг того, что фильтрация срабатывает если фильтр не установлен (добавление айди фильтра приводит к отключению фильтрации)
		 */
		public function registerFilteringFunction(filterID:String, filterFunction:Function, revert:Boolean = false):void
		{
			if (revert) {
				_revertedCreterias[filterID] = filterFunction;
			}
			else {
				_criterias[filterID] = filterFunction;
			}
		}
		
		/**
		 * добавляет фильтр
		 * @param    filterID    - айди фильтра
		 */
		public function addFilter(filterID:String):void
		{
			if (!hasFilter(filterID)) {
				_filters[_filters.length] = filterID;
			}
			
			invalidate();
		}
		
		/**
		 * содержится ли фильтр с указанным айди
		 * @param    filterID
		 * @return
		 */
		public function hasFilter(filterID:String):Boolean
		{
			return _filters.indexOf(filterID) != -1;
		}
		
		public function activeFilters():Array {
			return _filters;
		}
		
		/**
		 * удаляет фильтр
		 * @param    filterID    - айди фильтра
		 */
		public function removeFilter(filterID:String):void
		{
			var i:int = _filters.indexOf(filterID);
			if (i != -1) {
				_filters.splice(i, 1);
			}
			invalidate();
		}
		
		/**
		 * удаляет все фильтры
		 */
		public function removeAllFilters():void
		{
			_filters.length = 0;
			invalidate();
		}
		
		public function invalidate():void
		{
			if (_isActive) {
				_validator.invalidate();
			}
		}
		
		public function validateNow():void
		{
			_validator.validateNow();
		}
		
		private function validate():void
		{
			if (verbose) var t:int = getTimer();
			//	выбираем набор функций для фильтрации (для ускорения работы)
			_filterFunctions.length = 0;
			
			//	прямые фильтры
			var len:int = _filters.length;
			for (var i:int = 0; i < len; ++i) {
				var filterFunction:Function = _criterias[_filters[i]] as Function;
				if (filterFunction != null) {
					_filterFunctions.push(filterFunction);
				}
			}
			//	обратные фильтры
			for (var s:String in _revertedCreterias) {
				if (!hasFilter(s)) {
					_filterFunctions.push(_revertedCreterias[s]);
				}
			}
			
			//	производим фильтрацию
			_filtered = _source.filter(filteringTestFunction);
			//	извещаем слушателей о том, что фильтрация изменилась
			if (verbose) trace("Filtered in", int(getTimer() - t).toString(), "ms");
			onFiltered.fire();
		}
		
		private function filteringTestFunction(item:Object):Boolean
		{
			for each(var f:Function in _filterFunctions) {
				if (!f(item)) {
					return false;
				}
			}
			return true;
		}
		
		public static function returnTrue(...args):Boolean {return true;}
	}
	
}