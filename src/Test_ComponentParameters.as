package {

import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;

public class Test_ComponentParameters extends Sprite {
    public static const FILE_NAME:String = "../FLA/ComponentParametersTest.swf";
    private var MC_LIST_NAME:String = "mcList";
    private var list:*;
    public function Test_ComponentParameters() {
        Cc.start(this);
        Cc.visible = true;
        
        
        var loader:Loader = new Loader();
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
        loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadingFailed);
        loader.addEventListener(IOErrorEvent.NETWORK_ERROR, onLoadingFailed);
        loader.addEventListener(IOErrorEvent.VERIFY_ERROR, onLoadingFailed);
        loader.addEventListener(IOErrorEvent.DISK_ERROR, onLoadingFailed);
        loader.load(new URLRequest(FILE_NAME));
    }
    
    private function onLoaded(e:Event):void {
        trace("Successfully loaded " + FILE_NAME);
        var childSWF:DisplayObject = LoaderInfo(e.target).content;
        addChild(childSWF);
//        trace(childSWF.hasOwnProperty(MC_LIST_NAME))
        list = childSWF[MC_LIST_NAME];
//        trace(list.itemRendererName);
        list.addEventListener(Event.EXIT_FRAME, exitFrame);
        list.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        list.addEventListener(Event.ENTER_FRAME, enterFrame);
        list.addEventListener(Event.INIT, init);
    }
    
    private function init(event:Event):void {
        trace("init",list.itemRendererName);
        list.removeEventListener(Event.INIT, init);
    }
    
    private function enterFrame(event:Event):void {
        trace("enterFrame",list.itemRendererName);
        list.removeEventListener(Event.ENTER_FRAME, enterFrame);
    }
    
    private function addedToStage(event:Event):void {
        trace("addedToStage",list.itemRendererName);
        list.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
    }
    
    private function exitFrame(event:Event):void {
        trace("exitFrame",list.itemRendererName);
        list.removeEventListener(Event.EXIT_FRAME, exitFrame);
    }
    
    private function onLoadingFailed(e:IOErrorEvent):void {
        trace("Missing " + FILE_NAME);
    }
}
}
