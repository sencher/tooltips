package utils.wg.display.cache
{

import utils.wg.utils.display.cache.*;
    import flash.utils.getTimer;
    
    import scaleform.gfx.SystemEx;
    
    public class Cache
    {
        private static var _loaders:Object = {};		//	загрузчики
        
        /**
         * загружает или берет с кеша ресурс, который находится по указанному пути
         * @param    path        -    путь где находится ресурс
         * @param    client        -    клиент кеша
         */
        public static function getResource(path:String, client:ICacheClient=null):void
        {
            if (path == null) {
                trace("[ERROR]Cache::getResource: path can't be null!");
                trace(SystemEx.getStackTrace());
                return;
            }
            var loader:ResourceLoader = _loaders[path] as ResourceLoader;
            if (loader == null)	//	ресурс не загружается, запускаем загрузку
            {
                loader = createLoader(path);
                _loaders[path] = loader;
            }
            if (client) {
                loader.addClient(client);
			}
        }
        
        public static function releaseClient(path:String, client:ICacheClient):void
        {
            var loader:ResourceLoader = _loaders[path] as ResourceLoader;
            if (loader) {
                loader.removeClient(client);
            }
        }
        
        public static function getLoadedContent(path:String):Object
        {
            var loader:ResourceLoader = _loaders[path] as ResourceLoader;
            if (loader) {
                return loader.content;
            }
            return null;
        }
        
        public static function disposeResource(path:String):void
        {
            var loader:ResourceLoader = _loaders[path] as ResourceLoader;
            if (loader) {
                loader.dispose();
                delete _loaders[path];
            }
        }
        
        public static function dispose():void
        {
            trace("Cache::dispose...");
            var t:int = getTimer();
            for (var path:String in _loaders) {
                var loader:ResourceLoader = _loaders[path] as ResourceLoader;
                loader.dispose();
                trace("...", path, "has been disposed...");
            }
            
            _loaders = {};
            trace("...Cache::has been disposed in", getTimer() - t, "ms");
        }
        
        private static function createLoader(path:String):ResourceLoader
        {
            var ext:String;
            var arr:Array = path.split(".");
            if (arr.length > 1) {
                ext = arr[arr.length - 1];
            }
            if (ext == "xml" || ext == "css" || ext == "txt") {
                return new URLResourceLoader(path);
            }
            return new DefaultResourceLoader(path);
        }
        
    }
    
}
