package {
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class Test_Loader extends Sprite{
    private var xmlLoader:URLLoader;
    private var xml:XML;
    private var uRequest = new URLRequest("http://xxxxxxx/app.php");

    private var imgLoader:Loader;

    public function Test_Loader() {
        xmlLoader = new URLLoader(uRequest);
        xmlLoader.addEventListener(Event.COMPLETE, onXMLLoad);
        xmlLoader.addEventListener(IOErrorEvent.IO_ERROR, onImgLoadError);
    }

    private function onImgLoadError(event:IOErrorEvent):void {
        trace(event.text)
    }

    function onXMLLoad(e:Event) {
        xml = new XML(e.target.data);
        imgLoader = new Loader();
        imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImgLoaded);
        imgLoader.load(new URLRequest(xml.Data.Image.text()[0]));
    }

    function onImgLoaded(e:Event) {
        addChild(imgLoader);
    }
}
}
