package {

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.MovieClip;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.MouseEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

import wowp.utils.debug.DebugUtils;

[SWF(width="800",height="600")]
public class Dev_AddUniqueId extends BaseTest {
    private var loader:Loader;
    private var timeline:MovieClip;
    private var timelineTotalFrames:int;
    private var b1:MovieClip;
    
    public function Dev_AddUniqueId() {
//        loader = new URLLoader(new URLRequest("../FLA_experiments/TimelineButton.swf"));
        loader = new Loader();
        var loaderContext:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
        loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderCompleteHandler);
        loader.load(new URLRequest("../FLA_experiments/TimelineButton.swf"), loaderContext);
        addChild(loader);
        
//        var mc1:MovieClip = generateMC();
//        var mc2:MovieClip = generateMC();
//        var nd1:NonDynamic = generateND();
//        log(mc1.uniqueId, mc2.uniqueId, nd1["uniqueId"]);
        stage.addEventListener(MouseEvent.CLICK, clickHandler);
        
        var s1:Sprite;
        log(DebugUtils.uid(loader));
        log(DebugUtils.uid(s1));
        log(DebugUtils.uid(loaderContext));
        log(DebugUtils.uid(loader));
    }
    
    private function clickHandler(event:MouseEvent):void {
        if(timeline){
            if(timeline.currentFrame >= timelineTotalFrames){
//                timeline.gotoAndStop(1);
                timeline.gotoAndPlay(1);
            }else{
                timeline.nextFrame();
            }
            setUniqueIdToButton();
        }
    }
    
    private function setUniqueIdToButton():void {
        var button = timeline.mcButton;
        if(!button.uniqueId) button.uniqueId = DebugUtils.getUniqueId();
    }
    
    private function loaderCompleteHandler(event:Event):void {
        timeline = event.target.content;
        //timeline.addEventListener(Event.FRAME_CONSTRUCTED, timeline_frameConstructedHandler);
        timelineTotalFrames = timeline.totalFrames;
        b1 = timeline.mcButton;
        b1.addEventListener(MouseEvent.CLICK, b1_clickHandler);
        log("+", timeline, b1);
    }
    
    private function timeline_frameConstructedHandler(event:Event):void {
        log("timeline_frameConstructedHandler");
    }
    
    private function b1_clickHandler(event:MouseEvent):void {
        var currentTarget = event.currentTarget;
        log(currentTarget, currentTarget.uniqueId);
    }
    
    private function errorHandler(event:IOErrorEvent):void {
        log("-");
    }
    
    private function generateMC():MovieClip {
        var result:MovieClip = new MovieClip();
        result.uniqueId = DebugUtils.getUniqueId();
        return result;
    }
    
    private function generateND():NonDynamic {
        var result:NonDynamic = new NonDynamic();
        result["uniqueId"] = DebugUtils.getUniqueId();
        return result;
    }
}
}

class NonDynamic {

}
