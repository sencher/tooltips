package loader_test {
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

import utils.Utils;

public class Test_LoaderMain extends Sprite {
    //private var loader_test:LoaderInfo;
    private var loader:Loader = new Loader();
    var applicationCurrentDomain:ApplicationDomain = ApplicationDomain.currentDomain;
    
    public function Test_LoaderMain() {
        trace(applicationCurrentDomain.getQualifiedDefinitionNames());
//        c = Class(cur.getDefinition("com.junkbyte.console::Cc"));

        
        //вешаем обработчики событий ошибок загрузки
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, оnComplete);
//        loader_test.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, оnError);
//        loader_test.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, оnSequrityError);
        //грузим нашу флешку
//        var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
        var loaderContext:LoaderContext = new LoaderContext();
        loader.load(new URLRequest("Test_LoaderSecond.swf"), loaderContext);
    }

    private function оnComplete(event:Event):void {
//        trace(event, loader.loaderInfo.url);
        var targetDomain:ApplicationDomain = event.target.applicationDomain;
        trace("1*********************\n", targetDomain.getQualifiedDefinitionNames());
        
        var parentDomain:ApplicationDomain = targetDomain.parentDomain;
        if (parentDomain) {
            trace("2*********************\n", parentDomain.getQualifiedDefinitionNames());
        }
        
        if(applicationCurrentDomain){
            trace("3*********************\n", applicationCurrentDomain.getQualifiedDefinitionNames());
        }
        
        
//        trace(getDef("loader_test::Test_LoaderSecond", targetDomain));
//        trace(getDef("loader_test::Test_LoaderSecond", parentDomain));
//        trace(getDef("loader_test::Test_LoaderSecond", applicationCurrentDomain));

//        return;
        
//        var second:Class = Class(getDefinitionByName("loader_test::Test_LoaderSecond"));
        var second:Class = getDef("loader_test::Test_LoaderSecond", targetDomain);
        var secondInstance = new second();

        trace(secondInstance.hasOwnProperty("test"));
        trace(secondInstance["test"]());

        trace(secondInstance.hasOwnProperty("cc"));
        trace(secondInstance["cc"]("start", this));


//        trace(second.hasOwnProperty("cc"));
//        trace(second["cc"]());

        var cc = getDefinitionByName("com.junkbyte.console::Cc");
        cc.green2cw("ch1", 999999999999999);

        cc = Utils.getDefinitionIgnorePrefix("Cc3333");
        if (cc) cc.green2cw("ch1", "3333");

        cc = Utils.getDefinitionIgnorePrefix("Cc");
        cc.green2cw("ch1", "asdqwe");

        trace("end");
        trace(Utils.getPrefix(stage.loaderInfo.content));
        trace(Utils.getPrefix(this));
        trace(Utils.getPrefix(second));
        trace(Utils.getPrefix(secondInstance));
        trace(Utils.getPrefix(applicationCurrentDomain));
        trace(Utils.getPrefix(event));
        trace(Utils.getPrefix(event.target));
        trace(Utils.getPrefix(event.target.applicationDomain));
        trace(Utils.getPrefix(cc));
    }
    
    private function getDef(value:String, domain:ApplicationDomain):Class {
        var result:Class;
        try {
            result = domain.getDefinition(value) as Class;
        } catch (e) {
//        error( "getDefinition", name, "loaderInfo:", loaderInfo, "domain:", domain);
        }
        return result;
    }
}
}
