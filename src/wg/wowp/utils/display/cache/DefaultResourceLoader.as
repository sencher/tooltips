package wowp.utils.display.cache {

import com.junkbyte.console.Cc;
import com.junkbyte.console.core.ConsoleUtils;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

import wowp.utils.debug.DebugAssistant;

public class DefaultResourceLoader extends ResourceLoader {
    private const EXCLUDE:Array = ["trainings.swf"];
//    private const EXCLUDE:Array = [];
    
    private var _loader:Loader;
    private var _isLoad:Boolean;
    
    public function DefaultResourceLoader(path:String) {
        super(path);
    }
    
    override protected function load():void {
        
        if (DebugAssistant.SAVE_STACK_ON_ASYNC_CALLS) {
            loadCaller = "\n" + ConsoleUtils.whoCalledThis(100, 2);
        }
    
        var req:URLRequest = new URLRequest(_path);
    
        _isLoad = true;
    
        _loader = new Loader();
        _loader.load(req, new LoaderContext(false, ApplicationDomain.currentDomain));
        _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompletedHandler);
        _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
    }
    
    protected override function removeListeners():void {
        _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadCompletedHandler);
        _loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
    }
    
    private function loadCompletedHandler(e:Event):void {
        var content:Object = _loader.content;
        
        //	если загружали картинку, то загруженным ресурсом будет битмапдата
        if (content is Bitmap) {
            content = (content as Bitmap).bitmapData;
        }
        setLoadedContent(content);
        
        _isLoad = false;
    }
    
    override public function dispose():void {
//        Cc.tealcw(this, "DefaultResourceLoader.dispose _content:", _content, "_loader:", _loader);
        if (_content is BitmapData) {
            _content = null;
            //  не делать диспоз, иначе в других скринах вместо картинок могут появлятся черные прямоугольники
            //  воспроизводится на Scaleform 4.5.31 когда выйти в очередь нажав в кнопку "В бой" не дождавшись
            // полной прогрузки ангара
//                (_content as BitmapData).dispose();
        }
        if (_loader) {
            if (_isLoad) {
                try {
                    _loader.close();
                } catch (e:Error) {
            
                }
            }

//            var loaderInfo:LoaderInfo = _loader.loaderInfo;
//            var contentLoaderInfo:LoaderInfo = _loader.contentLoaderInfo;
//            if (loaderInfo) Cc.tealc(this, "loaderInfo.url:", loaderInfo.url, "loaderInfo.loaderURL:", loaderInfo.loaderURL);
//            if (contentLoaderInfo) Cc.tealc(this, "contentLoaderInfo.url:", contentLoaderInfo.url, "contentLoaderInfo.loaderURL:", contentLoaderInfo.loaderURL);
    
    
            if (EXCLUDE.length > 0) {
                for each (var search:String in EXCLUDE) {
                    if (_loader.contentLoaderInfo.url.toLowerCase().indexOf(search.toLowerCase()) > -1) {
//                        Cc.tealc(this, "Excluded:", _loader.contentLoaderInfo.url);
                    } else {
                        _loader.unloadAndStop();
                    }
                }
            } else {
//                _loader.unload();
                _loader.unloadAndStop();
            }
        }
        super.dispose();
    }
}
}
