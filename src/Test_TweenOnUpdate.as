package {
import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.Event;

[SWF(frameRate=120)]
public class Test_TweenOnUpdate extends Sprite {
    private var o:Object = {x:100};
    public function Test_TweenOnUpdate() {
        //addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        TweenLite.delayedCall(3, onAddedToStage)
    }
    
    private function onAddedToStage(event:Event = null):void {
        TweenLite.to(o, 0.5, {x:0, onUpdate: updateHandler, onUpdateParams:[], onComplete:completeHandler, onCompleteParams:[], onHalf:halfHandler});
    }
    
    private function halfHandler():void {
        trace("half");
    }
    
    private function completeHandler():void {
        trace("complete");
    }
    
    private function updateHandler():void {
        trace("update");
    }
}
}
