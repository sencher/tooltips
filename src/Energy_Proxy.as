package {
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import flash.system.Security;
    import flash.system.System;
    import flash.text.TextField;

    public class Energy_Proxy extends Sprite{
        private var tf:TextField = new TextField();
        private var tf2:TextField = new TextField();

        public function Energy_Proxy() {
            Security.allowDomain("*");
            Security.allowInsecureDomain("*");
            var d:Date = new Date();
            var path:String = "debug.swf"+"?t="+String(d.time);
            trace(path);
            tf.text = path;
            tf.width = 500;
            tf2.y = 15;
            tf2.width = 500;
            addChild(tf);
            addChild(tf2);
            var request:URLRequest = new URLRequest(path);
            var loader:Loader = new Loader()
//            addChild(loader_test);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
            loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError_handler, false, 0, true);
            loader.load(request);
        }
        internal function onCompleteHandler(loadEvent:Event):void
        {
            stage.addChild(loadEvent.currentTarget.content);
        }
        internal function onProgressHandler(mProgress:ProgressEvent):void
        {
            var percent:Number = mProgress.bytesLoaded/mProgress.bytesTotal;
            trace(percent)
            tf2.text = String(percent);
        }
        public function ioError_handler(event:IOErrorEvent):void
        {
            trace(event.toString());
        }
    }
}