package utils.wg.utils.xml
{
	import wowp.utils.data.binding.Signal;
	import wowp.utils.display.cache.Cache;
	import wowp.utils.display.cache.ICacheClient;

	public class XMLLoader implements ICacheClient
	{
		public const onLoaded:Signal = new Signal();

		private var _updateWhenLoadedSignal:Signal = new Signal();
		private var _path:String;
		private var _isLoaded:Boolean = false;
		private var _xml:XML;

		public function get path():String {return _path;}

		public function get isLoaded():Boolean {return _isLoaded;}

		public function get xml():XML {return _xml;}

		public function XMLLoader(path:String = null, loadedHandler:Function = null) {
			if (path) {
				if (loadedHandler != null) {
					onLoaded.add(loadedHandler);
				}
				load(path);
			}
		}

		public function load(path:String):void {
			if (_path != null) {
				Cache.releaseClient(path, this);
			}
			_isLoaded = false;
			_path = path;
			Cache.getResource(path, this);
		}

		public function clear():void {
			Cache.releaseClient(path, this);
			_path = null;
			_isLoaded = false;
			_updateWhenLoadedSignal.dispose();
		}

		public function onResourceLoaded(resource:Object):void {
			_xml = XML(resource);
			_isLoaded = true;
			onLoaded.fire();
			_updateWhenLoadedSignal.fire();
			_updateWhenLoadedSignal.dispose();
		}

		/**
		 * если загрузилось, то колбек вызывается сразу, если нет, то вызовется когда загрузится
		 * если загрузилось, то колбек вызывается сразу, если нет, то вызовется когда загрузится
		 * @param callback
		 */
		public function updateWhenLoaded(callback:Function):void {
			if (isLoaded) {
				callback();
			} else {
				_updateWhenLoadedSignal.add(callback);
			}
		}

		public function onError():void {

		}
	}
}
