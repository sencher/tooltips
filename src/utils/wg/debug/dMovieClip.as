package utils.wg.debug {

import com.junkbyte.console.Cc;

import flash.display.MovieClip;
import flash.events.Event;

public class dMovieClip extends MovieClip {
    public function dMovieClip() {
        super();
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
    }
    
    override public function set visible(value:Boolean):void {
        //Cc.bluecw(this, "set visible", visible, ">", value, "alpha", alpha);
        super.visible = value;
    }
    
    override public function set alpha(value:Number):void {
        //Cc.bluecw(this, "set alpha", alpha, ">", value, "visible", visible);
        super.alpha = value;
    }
    
    private function removedFromStageHandler(event:Event):void {
        //Cc.bluecw(this, "removedFromStageHandler");
    }
    
    private function addedToStageHandler(event:Event):void {
        //Cc.bluecw(this, "addedToStageHandler");
    }
}
}
