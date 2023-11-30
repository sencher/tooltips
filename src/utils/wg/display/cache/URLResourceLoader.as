package utils.wg.display.cache
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.System;

	public class URLResourceLoader extends ResourceLoader
	{
		private var _loader:URLLoader;

		public function URLResourceLoader(path:String) {
			super(path);
		}

		override protected function load():void {
			_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE, loadCompletedHandler);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			_loader.load(new URLRequest(_path));
		}

		protected override function removeListeners():void {
			_loader.removeEventListener(Event.COMPLETE, loadCompletedHandler);
			_loader.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
		}

		private function loadCompletedHandler(e:Event):void
		{
			setLoadedContent(_loader.data);
		}

		private function errorHandler(e:Event):void {
			setLoadedContent(null);
		}

		override public function dispose():void {
			if (_content is XML) {
				System.disposeXML(_content as XML);
			}
			if (_loader) {
				_loader.close();
			}
			super.dispose();
		}
	}
}
