package utils.wg.display.cache
{

import com.junkbyte.console.Cc;

import wowp.utils.array.findByField;
	import wowp.utils.array.safeSplice;
	import wowp.utils.data.binding.Signal;

	public class ItemsPreloader
	{
		public const onLoaded:Signal = new Signal();

		private var _items:Vector.<ItemHolder> = new <ItemHolder>[];

		public function get hasLoaded():Boolean {return _items.length == 0;}

		public function ItemsPreloader() {
		}

		public function addPaths(...arr):void {
            //Cc.logcw(this, "addPaths", arr);
			var len:int = arr.length;
			for (var i:int = 0; i < len; ++i) {
				var p:String = arr[i];
				if (p != null) {
					if (findByField(_items, "path", p) == null) {
						var ih:ItemHolder = new ItemHolder();
						ih.path = p;
						ih.onLoaded.add(loadedHandler);
						_items.push(ih);
					}
				}
			}
		}

		public function load():void {
			var items:Vector.<ItemHolder> = _items.slice();
			var len:int = items.length;
			for (var i:int = 0; i < len; ++i) {
				items[i].load();
			}
		}

		public function clear():void {
			var len:int = _items.length;
			for (var i:int = 0; i < len; ++i) {
				_items[i].onLoaded.remove(loadedHandler);
			}
			_items.length = 0;
		}

		private function loadedHandler(item:ItemHolder):void {
            //Cc.logcw(this, "loadedHandler", item, item.path);
			item.onLoaded.remove(loadedHandler);
			safeSplice(_items, item);
			if (_items.length == 0) {
                //Cc.infochw(this, "onLoaded.fire();");
				onLoaded.fire();
			}
		}
	}
}

import wowp.utils.data.binding.Signal;
import wowp.utils.display.cache.Cache;
import wowp.utils.display.cache.ICacheClient;

class ItemHolder implements ICacheClient
{
	public const onLoaded:Signal = new Signal();
	public var path:String;

	public function onResourceLoaded(resource:Object):void {
		Cache.releaseClient(path, this);
		dispatchLoaded();
	}

	public function onError():void {
		Cache.releaseClient(path, this);
		dispatchLoaded();
	}

	public function load():void {
		Cache.getResource(path, this);
		onError();
	}

	protected function dispatchLoaded():void {
		onLoaded.fire(this);
	}
}
