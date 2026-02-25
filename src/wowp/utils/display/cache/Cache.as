package wowp.utils.display.cache {

import com.junkbyte.console.Cc;
import com.junkbyte.console.Ct;

import flash.utils.getTimer;

import wowp.core.error;

import wowp.utils.object.ObjectUtils;

public class Cache {
    private static var _loaders:Object = {};		//	загрузчики
    
    /**
     * загружает или берет с кеша ресурс, который находится по указанному пути
     * @param    path        -    путь где находится ресурс
     * @param    client        -    клиент кеша
     */
    public static function getResource(path:String, client:ICacheClient = null):void {
        if (path == null) {
            error("Cache::getResource <> path can't be null!");
            //trace(SystemEx.getStackTrace());
            return;
        }
        var loader:ResourceLoader = _loaders[path] as ResourceLoader;
        if (loader == null)	//	ресурс не загружается, запускаем загрузку
        {
            loader = createLoader(path);
            _loaders[path] = loader;
//            Cc.magentacw("Cache", "getResource path:", path, "loader:", loader, "_loaders:", ObjectUtils.copyAndSortByExtension(_loaders));
        }
        if (client) {
            loader.addClient(client);
        }
    }
    
    public static function releaseClient(path:String, client:ICacheClient):void {
        var loader:ResourceLoader = _loaders[path] as ResourceLoader;
//        Cc.magentacw("Cache", "releaseClient path:", path, "client:", client, "loader:", loader, "_loaders:", ObjectUtils.copyAndSortByExtension(_loaders));
        if (loader) {
            loader.removeClient(client);
        }
    }
    
    public static function getLoadedContent(path:String):Object {
        var loader:ResourceLoader = _loaders[path] as ResourceLoader;
//        Cc.magentacw("Cache", "getLoadedContent path:", path, "loader:", loader, "_loaders:", ObjectUtils.copyAndSortByExtension(_loaders));
        if (loader) {
            return loader.content;
        }
        return null;
    }
    
    public static function disposeResource(path:String):void {
        var loader:ResourceLoader = _loaders[path] as ResourceLoader;
//        Cc.magentacw("Cache", "disposeResource path:", path, "loader:", loader, "_loaders:", ObjectUtils.copyAndSortByExtension(_loaders));
        if (loader) {
            loader.dispose();
            delete _loaders[path];
//            Cc.berryc("Cache", path, "disposed! _loaders:", ObjectUtils.copyAndSortByExtension(_loaders));
        }
    }
    
    public static function dispose():void {
//        Cc.magentacw("Cache", "dispose _loaders:", ObjectUtils.copyAndSortByExtension(_loaders));
        trace("Cache::dispose...");
        var t:int = getTimer();
        for (var path:String in _loaders) {
            var loader:ResourceLoader = _loaders[path] as ResourceLoader;
//            Cc.greyc("Cache", "dispose path:", path, "loader:", loader);
            loader.dispose();
            trace("...", path, "has been disposed...");
        }
        
        _loaders = {};
        trace("...Cache::has been disposed in", getTimer() - t, "ms");
    }
    
    private static function createLoader(path:String):ResourceLoader {
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
