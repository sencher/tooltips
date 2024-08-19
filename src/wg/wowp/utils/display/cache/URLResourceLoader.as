package wowp.utils.display.cache {

import com.junkbyte.console.core.ConsoleUtils;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.system.System;

import wowp.utils.debug.DebugAssistant;

public class URLResourceLoader extends ResourceLoader {
    private var _loader:URLLoader;
    
    public function URLResourceLoader(path:String) {
        super(path);
    }
    
    override protected function load():void {
        if (DebugAssistant.SAVE_STACK_ON_ASYNC_CALLS) {
            loadCaller = "\n" + ConsoleUtils.whoCalledThis(100, 2);
        }
        _loader = new URLLoader();
        _loader.addEventListener(Event.COMPLETE, loadCompletedHandler);
        _loader.addEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
        _loader.load(new URLRequest(_path));
    }
    
    protected override function removeListeners():void {
        _loader.removeEventListener(Event.COMPLETE, loadCompletedHandler);
        _loader.removeEventListener(IOErrorEvent.IO_ERROR, loadErrorHandler);
    }
    
    private function loadCompletedHandler(e:Event):void {
        setLoadedContent(_loader.data);
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
