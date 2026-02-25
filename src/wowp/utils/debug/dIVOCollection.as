package wowp.utils.debug
{

import com.junkbyte.console.Cc;

import wowp.data.base.*;
	import wowp.core.data.InterfaceService;
	import wowp.utils.array.getKeyArray;
	import wowp.utils.data.binding.Signal;
	import wowp.utils.data.binding.SignalOnce;
	import wowp.utils.timeout.TimeoutValidator;
	
	public class dIVOCollection
	{
		/**
		 * срабатывает когда апдейтится какой-то элемент коллекции
		 * Слушатель должен принимать id
		 */
		public const onItemUpdated:Signal = new Signal();
		
		/**
		 * срабатывает когда апдейтится какой-то элемент коллекции
		 */
		public const onUpdated:Signal = new Signal();
		/**
		 * срабатывает когда хотябы один элемент коллекции становится невалидным. Это происходит когда мы добавляем
		 * новые айдишники
		 */
		public const onInvalid:Signal = new Signal();
		/**
		 * срабатывает когда все данные по всем айдишникам загрузились
		 */
		public const onValid:Signal = new Signal();
		/**
		 * срабатывает когда все данные по всем айдишникам загрузились и проивзодит отписку
		 */
		public const onValidOnce:SignalOnce = new SignalOnce();
		/**
		 * срабатывает когда удаляется или добавляется какой-либо элемент в коллекцию.
		 * Если было добавление, то сигнал сработает после того, как коллекция станет валидной, т.е. после срабатывания
		 * сигнала onValid
		 */
		public const onChanged:Signal = new Signal();
		
		protected var _itemClass:Class;
		protected var _isValid:Boolean = true;
		
		public function get itemClass():Class {
			return _itemClass;
		}
		
		protected function setValidation(value:Boolean):void {
			//Cc.bluecw(_itemClass, "setValidation", value);
			if (_isValid != value) {
				_isValid = value;
				if (_isValid) {
					//Cc.yellowcw(_itemClass, "onValid + onValidOnce");
					onValidOnce.fire();
					onValid.fire();
				} else {
					//Cc.yellowcw(_itemClass, "onInvalid");
					onInvalid.fire();
				}
			}
		}
		
		private const _invalidIDs:ArrayOfID = new ArrayOfID();
		
		public function isItemInvalid(id:*):Boolean {
			return _invalidIDs.indexOf(id) != -1;
		}
		
		public function get invalidCount():int {return _invalidIDs.length;}
		
		private const _items:Object = {};
		private const _ids:ArrayOfID = new ArrayOfID();
		private const _updateCollectionTimeout:TimeoutValidator = new TimeoutValidator(updateCollection);
		
		private var _collectionChanged:Boolean = false;
		
		/**
		 * возращает дикшенери объектов, где ключ - айди объекта (String or Array of String), значение - объект
		 * НЕ КОПИЯ!
		 * @return
		 */
		public function getItems():Object {
			return _items;
		}
		
		/**
		 * возвращает массив объектов которые являются обертками над загруженными айтемами
		 * @param c
		 * @return
		 */
		public function wrap(c:Class):Array {
			var arr:Array = [];
			for each(var item:Object in _items) {
				arr[arr.length] = new c(item);
			}
			return arr;
		}
		
		/**
		 * флаг того, что все элементы контейнера загружены
		 */
		public function get isValid():Boolean {
			//Cc.green2cw(_itemClass, "isValid", _isValid);
			return _isValid;
		}
		
		/**
		 * возвращает список айдишек объектов, которые содержатся в контейнере
		 * НЕ КОПИЯ!
		 */
		public function get ids():Array {
			return _ids;
		}
		
		public function dIVOCollection(itemClass:Class) {
			_itemClass = itemClass;
		}
		
		public function dispose():void {
			clear();
			onItemUpdated.dispose();
			onUpdated.dispose();
			onValid.dispose();
			onChanged.dispose();
			onInvalid.dispose();
			_updateCollectionTimeout.validateNow();
			_updateCollectionTimeout.dispose();
		}
		
		/**
		 * очистка коллекции
		 */
		public function clear():void {
			if (_ids.length != 0) {
				_ids.length = 0;
				_updateCollectionTimeout.invalidate();
				//	коллекция стала невалидной
				setValidation(false);
			}
		}
		
		/**
		 * установить массив айдишек, объекты которых будут загружены в коллекцию
		 * @param arr
		 */
		public function setIDs(arr:Array):void {
			clear();
			if (arr && arr.length > 0) {
				var len:int = arr.length;
				for (var i:int = 0; i < len; ++i) {
					appendID(arr[i]);
				}
			}
		}
		
		/**
		 * добавляет айдишник в коллекцию
		 * @param id
		 */
		public function appendID(id:*):void {
			if (_ids.indexOf(id) == -1) {
				_ids.push(id);
				var item:IAutoIVO = getItemByID(id);
				if (!item || !item.isValid()) {
					_invalidIDs.addOnce(id);
				}
				
				//	коллекция стала невалидной
				setValidation(false);
				_updateCollectionTimeout.invalidate();
			}
		}
		
		public function removeID(id:*):void {
			var index:int = _ids.indexOf(id);
			if (index != -1) {
				_ids.splice(index, 1);
				//	коллекция стала невалидной
				setValidation(false);
				_updateCollectionTimeout.invalidate();
			}
		}
		
		/**
		 * добавляет массив айдишиников в коллекцию
		 * @param arr
		 * @param onLoaded - is called immediately if all items have been already loaded, if any of them hasn't then waits for it
		 * @return whether those items has been already loaded or not
		 */
		public function appendIds(arr:Array, onLoaded:Function = null):Boolean {
			//Cc.bluecw(_itemClass, "appendIds", arr, onLoaded);
			if (arr && arr.length > 0) {
				var len:int = arr.length;
				for (var i:int = 0; i < len; ++i) {
					appendID(arr[i]);
				}
			}
			
			if (_isValid) {
				if (onLoaded != null) onLoaded();
				
				//	TODO: remove onValid firing
				//	use return flag or the onLoaded callback instead
				//Cc.yellowcw(_itemClass, "onValid");
				onValid.fire();
				return true;
			}
			
			if (onLoaded != null) onValidOnce.add(onLoaded);
			
			return false;
		}
		
		/**
		 * возвращает объект по айдишнику
		 * @param id
		 * @return
		 */
		public function getItemByID(id:*):IAutoIVO {
			return _items[id];
		}
		
		private function updateCollection():void {
			//Cc.bluecw(_itemClass, "updateCollection");
			var ivo:IAutoIVO;
			var ids:Array = _ids.slice();
			var keys:Array = getKeyArray(_items);
			//	ищем удаленные айдишники, удаляем соотвествующие объекты; удаляем айдишники существующих объектов
			for each (var key:* in keys) {
				ivo = _items[key];
				var index:int = ids.indexOf(ivo.id);
				if (index == -1) {
					//	произошло удаление
					if (ivo != null) {
						ivo.onInstanceUpdated.remove(itemUpdateHandler);
						ivo.onInstanceDisposed.remove(itemDisposeHandler);
						ivo.dispose();
						delete _items[key];
					}
					_invalidIDs.safeRemove(key);
					_collectionChanged = true;
				} else {
					ids.splice(index, 1);
				}
			}
			
			//	если остались айдишники, то это новые объекты, создаем их
			//	fixme: если будет большой список, то возможно нужно будет разнести процесс создания по кадрам
			var len:int = ids.length;
			if (len > 0) {
				_collectionChanged = true;
				//	сначала помечаем невалидные айдишки
				//	Если это сделать в том же цикле, что и создание объектов, то может возникнуть ситуация, когда
				//	новосозданные объекты мнгновенно получат данные с бекенда, отработает itemUpdateHandler который
				//	уберет айдишку объекта из списка невалидных объектов. Если посреди цикла массив _invalidIDs станет пустым,
				//  то ошибочно может сработать сигнал, что все загрузилось.
				for (var i:int = 0; i < len; ++i) {
					_invalidIDs.addOnce(ids[i]);
				}
				
				//	коллекция стала невалидной
				setValidation(false);
				
				//	создаем объекты
				//Cc.bluecw(_itemClass, "InterfaceService beginQuerySequence", ids);
				InterfaceService.instance.beginQuerySequence();
				for (i = 0; i < len; ++i) {
					var id:* = ids[i];
					ivo = createItem(id);
					ivo.onInstanceUpdated.add(itemUpdateHandler);
					ivo.onInstanceDisposed.add(itemDisposeHandler);
					_items[id] = ivo;
					if (ivo.isValid()) {
						//	если попали сюда, то объект получил данные мнгновенно, еще до того, как мы повесили слушатель
						//	поэтому вызываем колбек вручную
						itemUpdateHandler(ivo);
					}
				}
				//Cc.bluecw(_itemClass, "InterfaceService endQuerySequence", ids);
				InterfaceService.instance.endQuerySequence();
			} else {
				//	если попали сюда, то новых объектов не создавалось. Оповещаем об изменении коллекции если нужно
				setValidation(_invalidIDs.length == 0);
				fireCollectionChange();
			}
		}
		
		protected function createItem(id:*):IAutoIVO {
			//Cc.bluecw(_itemClass, "createItem", id);
			return new _itemClass(id);
		}
		
		private function itemUpdateHandler(ivo:IAutoIVO):void {
			//Cc.bluecw(_itemClass, "itemUpdateHandler", ivo, ivo.id);
			if (!ivo.isValid()) return;
			_invalidIDs.safeRemove(ivo.id);
			if (!_updateCollectionTimeout.isInvalid) {
				setValidation(_invalidIDs.length == 0);
				fireCollectionChange();
			}
			//Cc.yellowcw(_itemClass, "onItemUpdated + onUpdated");
			onItemUpdated.fire(ivo.id);
			onUpdated.fire();
		}
		
		private function fireCollectionChange():void {
			//Cc.bluecw(_itemClass, "fireCollectionChange _collectionChanged", _collectionChanged, "isValid", isValid);
			if (_collectionChanged && isValid) {
				_collectionChanged = false;
				//Cc.yellowcw(_itemClass, "onChanged");
				onChanged.fire();
			}
		}
		
		public static function areValid(...args):Boolean {
			var len:int = args.length;
			for (var i:int = 0; i < len; ++i) {
				if (args[i] == null || !args[i].isValid) {
					return false;
				}
			}
			return true;
		}
		
		
		private function itemDisposeHandler(ivo:IAutoIVO):void {
			//Cc.bluecw(_itemClass, "itemDisposeHandler", ivo, ivo.id);
			removeID(ivo.id);
			_updateCollectionTimeout.validateNow();
		}
	}
}

use namespace AS3;

internal dynamic class ArrayOfID extends Array
{
	
	override AS3 function indexOf(searchElement:*, fromIndex:* = 0):int {
		var l:int = length;
		var i:int;
		if (searchElement is Array) {
			var p:String = (searchElement as Array).join(SEP);
			for (i = fromIndex; i < l; ++i) {
				var obj:Object = this[i];
				if (obj is Array) {
					if ((obj as Array).join(SEP) == p) {
						return i;
					}
				}
			}
		}
		//	super.indexOf doesn't work.
		//return super.AS3::indexOf(searchElement, fromIndex);
		//
		for (i = fromIndex; i < l; ++i) {
			if (this[i] == searchElement) {
				return i;
			}
		}
		return -1;
	}
	
	public function addOnce(item:*):void {
		if (indexOf(item) == -1) {
			push(item);
		}
	}
	
	public function safeRemove(item:*):void {
		var index:int = indexOf(item);
		if (index != -1) {
			splice(index, 1);
		}
	}
}

internal const SEP:String = "%#%";