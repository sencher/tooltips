package {
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.system.Security;
    import flash.system.SecurityDomain;

    public class Test_Loader extends Sprite {

        var loader:Loader = new Loader();

        public function Test_Loader() {
            Security.allowDomain("*")

//        loader.load( new URLRequest("http://www.onspeed.com/ie/swf/img/logo.gif") );
//        loader.load( new URLRequest("http://www.onspeed.com/ie/swf/onspeed_comparison.swf") );
//        loader.load( new URLRequest("http://dagobah.net/flash/tetris.swf") );
            loader.load(new URLRequest("http://games-swf.ru/_sf/36/3640___.swf"));
//        loader.load( new URLRequest("http://sheldonbrown.com/web_sample1.html") );
            addChild(loader);

            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderDone);
            loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loaderProgress);

        }


        function loaderDone(event:Event):void {
// remove the listeners with these lines:
            event.target.removeEventListener(Event.COMPLETE, loaderDone);
            event.target.removeEventListener(ProgressEvent.PROGRESS, loaderProgress);

// do whatever with it...
//        blah();
//            stage.width = loader.width;
//            stage.height = loader.height;
        }

        function loaderProgress(event:ProgressEvent):void {
// get the percent done
            var percent:int = int((event.bytesLoaded / event.bytesTotal) * 100);

// do whatever with it...
//        blah();
        }
    }
}
