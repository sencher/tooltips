package utils.wg.debug {

import com.junkbyte.console.Cc;

import flash.events.Event;

import wowp.controls.BaseComponent;
import wowp.utils.debug.DebugUtils;

public class dBaseComponent extends BaseComponent {
    public function dBaseComponent() {
        //Cc.bluecw(this, "constructor");
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
        super();
    }
    
    override public function set width(value:Number):void {
        //Cc.bluecw(this, "set width", super.width, ">", value);
        super.width = value;
    }
    
    override public function set height(value:Number):void {
        //Cc.bluecw(this, "set height", super.height, ">", value);
        super.height = value;
    }
    
    override public function set scaleX(value:Number):void {
        //Cc.bluecw(this, "set scaleX", super.scaleX, ">", value);
        super.scaleX = value;
    }
    
    override public function set scaleY(value:Number):void {
        //Cc.bluecw(this, "set scaleY", super.scaleY, ">", value);
        super.scaleY = value;
    }
    
    
    override public function invalidate(...flags):void {
        //Cc.bluecw(this, "invalidate", flags);
        super.invalidate(flags);
    }
    
    override public function renderHandler(e:Event):void {
        //Cc.bluecw(this, "renderHandler", e.type, e);
        super.renderHandler(e);
    }
    
    
    override public function clearValidation():void {
        //Cc.bluecw(this, "clearValidation");
        super.clearValidation();
    }
    
    override protected function addedToStageHandler(e:Event = null):void {
        //Cc.bluecw(this, "addedToStageHandler", e, DebugUtils.sizeToString(this));
        super.addedToStageHandler(e);
    }
    
    override protected function removedFromStageHandler(e:Event = null):void {
        //Cc.bluecw(this, "removedFromStageHandler", e, DebugUtils.sizeToString(this));
        super.addedToStageHandler(e);
    }
}
}
