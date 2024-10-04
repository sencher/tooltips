package {

import com.greensock.events.LoaderEvent;
import com.greensock.loading.XMLLoader;
import com.junkbyte.console.Cc;

import flash.events.Event;

import wowp.utils.xml.XMLLoader;

public class Dev_ConsoleXml extends BaseTest {
//    private static const PATH:String = "../src/xml/novelty.xml";
    private static const PATH:String = "../src/xml/images.xml";
    private static const XML_STRING:String = "<a>zaza></a>";
    private static const BULLSHIT:String = "azazaa";
    public function Dev_ConsoleXml() {
//        load(PATH, loadHandler);
//        new XMLLoader(PATH, loadHandler);
        
        showConsole();
        
        Cc.red(XML_STRING);
        Cc.yellow(XML(XML_STRING));
        Cc.red(BULLSHIT);
        Cc.yellow(XML(BULLSHIT));
        
//        var loader:com.greensock.loading.XMLLoader = new com.greensock.loading.XMLLoader(PATH);
//        loader.addEventListener(LoaderEvent.COMPLETE, loadHandler);
//        loader.load();
    }
    
    private function loadHandler(event:Event):void {
        Cc.green2cw(this, {a:4});
        Cc.green2cw(this, event.target.content);
    }
}
}
