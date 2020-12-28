package utils.wg.utils.display.cache
{
	import wowp.utils.array.addOnce;
	
	internal class ResourceLoader
	{
		private var _clients:Vector.<ICacheClient> = new Vector.<ICacheClient>();
		
		protected var _path:String;
		protected var _content:Object;		//	загруженный ресурс
		private var _loaded:Boolean;
		private var _error:Boolean;
		
		public function get content():Object {return _content;}
		
		public function ResourceLoader(path:String)
		{
			_path = path;
			load();
		}
		
		protected function load():void {
		
		}
		
		protected function removeListeners():void {
		
		}
		
		protected function setLoadedContent(content:Object):void {
			removeListeners();
			_content = content;
			_error = content == null;
			_loaded = true;
			//	чтобы во время цикла не произошло удаление из _clients делаем копию
			var vec:Vector.<ICacheClient> = _clients.slice();
			_clients.length = 0;
			for each(var client:ICacheClient in vec) {
				if (_error) {
					client.onError();
				} else {
					client.onResourceLoaded(_content);
				}
			}
		}
		
		public function addClient(client:ICacheClient):void
		{
			if (_loaded) {
				if(_error){
					client.onError();
				}else{
					client.onResourceLoaded(_content);
				}
			}
			else {
				addOnce(_clients, client);
			}
		}
		
		public function removeClient(client:ICacheClient):void
		{
			var index:int = _clients.indexOf(client);
			if (index > -1) {
				_clients.splice(index, 1);
			}
		}
		
		public function dispose():void
		{
			removeListeners();
			_clients.length = 0;
			_content = null;
		}
		
		public function get clients():Vector.<ICacheClient>
		{
			return _clients;
		}
	}
	
}