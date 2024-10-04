package wowp.utils.display.cache {

import com.junkbyte.console.Ct;
import com.junkbyte.console.core.ConsoleUtils;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

import wowp.utils.debug.DebugAssistant;
import wowp.utils.debug.DebugUtils;
import wowp.utils.domain.DomainUtils;

public class DefaultResourceLoader extends ResourceLoader {
    private const UNLOAD_EXCLUDE:Array = ["trainings.swf"];
    
    private var _loader:Loader;
    private var _isLoad:Boolean;
    
    public function DefaultResourceLoader(path:String) {
        if (DebugAssistant.isInLoadInfoFilter(path)) Ct.bluecw(this, "DefaultResourceLoader.cons uid:", DebugUtils.uid(this), "path:", path);
        super(path);
    }
    
    override protected function load():void {
        if (DebugAssistant.isInLoadInfoFilter(_path)) Ct.tealcw(this, "DefaultResourceLoader.load uid:", DebugUtils.uid(this), "_path:", _path);
        
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
        if (DebugAssistant.isInLoadInfoFilter(_path)) {
            var target:LoaderInfo = LoaderInfo(e.target);
        
            Ct.tealcw(this, "DefaultResourceLoader.loadCompletedHandler uid:", DebugUtils.uid(this), "url:", target.url, "target:", target/*, "classes in domain:", DomainUtils.getQualifiedDefinitionNamesIgnorePrefix(target.applicationDomain)*/);
        
            //not realized in Scaleform
//            if (target.applicationDomain) {
//                var domainClasses:Vector.<String> = DomainUtils.getQualifiedDefinitionNamesIgnorePrefix(target.applicationDomain);
//                if (domainClasses) {
//                    Ct.tealc(this, "classes in domain:", domainClasses);
//                } else {
//                    Ct.red2c(this, "target.loaderURL:", target.loaderURL, "target.url:", target.url, "target.swfVersion:", target.swfVersion);
//                }
//            } else {
//                Ct.redc(this, "uid:", DebugUtils.uid(this), "applicationDomain null!");
//            }
        }
    
        var content:Object = _loader.content;
    
        //	если загружали картинку, то загруженным ресурсом будет битмапдата
        if (content is Bitmap) {
            content = (content as Bitmap).bitmapData;
        }
        setLoadedContent(content);
    
        _isLoad = false;
    }
    
    override public function dispose():void {
        if (DebugAssistant.isInLoadInfoFilter(_path)) Ct.tealcw(this, "DefaultResourceLoader.dispose uid:", DebugUtils.uid(this), "_content:", _content, "_loader:", _loader);
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
    
    
            if (UNLOAD_EXCLUDE.length > 0) {
                for each (var search:String in UNLOAD_EXCLUDE) {
                    if (_loader.contentLoaderInfo.url.toLowerCase().indexOf(search.toLowerCase()) > -1) {
                        if (DebugAssistant.isInLoadInfoFilter(_path)) Ct.tealcw(this, "DefaultResourceLoader ; Skip EXCLUDED uid:", DebugUtils.uid(this), "url:", _loader.contentLoaderInfo.url);
                    } else {
                        if (DebugAssistant.isInLoadInfoFilter(_path)) Ct.tealcw(this, "DefaultResourceLoader ; unloadAndStop uid:", DebugUtils.uid(this), "url:", _loader.contentLoaderInfo.url);
                        _loader.unloadAndStop();
                    }
                }
            } else {
                if (DebugAssistant.isInLoadInfoFilter(_path)) Ct.tealcw(this, "DefaultResourceLoader ; unloadAndStop url:", _loader.contentLoaderInfo.url);
//                _loader.unload();
                _loader.unloadAndStop();
            }
        }
        super.dispose();
    }
}
}
