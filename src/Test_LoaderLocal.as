package {
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IEventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

public class Test_LoaderLocal extends Sprite{
    private var loader:flash.display.Loader;
    public function Test_LoaderLocal() {
//        var loader_mc:Loader =new Loader();
//        addChild( loader_mc );// Add the loader to the display list
//        loader_mc.load( "swf/Girl_bkg_January_05.swf");// Load the file


        loader = new Loader();
        configureListeners(loader.contentLoaderInfo);
        //path from compiled Main.swf folder
        var url:URLRequest = new URLRequest("../src/swf/Girl_bkg_January_05.swf");
        var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
        loader.load(url, loaderContext);
//        loader.scaleX = loader.scaleY = 0.2;
//        loader.width = 400;
//        loader.height = 300;
        loader.x = loader.y = 0;

        addChild(loader);
    }

    private function configureListeners(dispatcher:IEventDispatcher):void {
        dispatcher.addEventListener(Event.COMPLETE, completeHandler);
        dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
        dispatcher.addEventListener(Event.INIT, initHandler);
        dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        dispatcher.addEventListener(Event.OPEN, openHandler);
        //dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
        dispatcher.addEventListener(Event.UNLOAD, unLoadHandler);
    }

    private function completeHandler(event:Event):void {
        trace(loader.width);
        trace("completeHandler: " + event);
        loader.content.width = 400;
        loader.content.height = 800;
    }

    private function httpStatusHandler(event:HTTPStatusEvent):void {
        trace("httpStatusHandler: " + event);
    }

    private function initHandler(event:Event):void {
        trace("initHandler: " + event);
    }

    private function ioErrorHandler(event:IOErrorEvent):void {
        trace("ioErrorHandler: " + event);
    }

    private function openHandler(event:Event):void {
        trace("openHandler: " + event);
    }

    private function progressHandler(event:ProgressEvent):void {
        trace("progressHandler: bytesLoaded=" + event.bytesLoaded + " bytesTotal=" + event.bytesTotal);
    }

    private function unLoadHandler(event:Event):void {
        trace("unLoadHandler: " + event);
    }
}
}
