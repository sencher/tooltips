package utils.wg.debug {

import com.junkbyte.console.Cc;

import flash.display.MovieClip;
import flash.events.Event;

import scaleform.clik.constants.InvalidationType;

import scaleform.clik.controls.StatusIndicator;

public class dStatusIndicator extends StatusIndicator {
    public function dStatusIndicator() {
        //Cc.bluecw(this, "constructor");
        addEventListener(Event.ADDED_TO_STAGE, addedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
        
        super();
    }
    
    private function handleDebugEvents(event:DebugEvent):void {
        //Cc.bluecw(this, "handleDebugEvents", event);
        switch (event.type) {
            case DebugEvent.MINIMUM:
                minimum = event.data;
                break;
            case DebugEvent.MAXIMUM:
                maximum = event.data;
                break;
            case DebugEvent.VALUE:
                value = event.data;
                break;
            case DebugEvent.POSITION:
                position = event.data;
                break;
        }
    }
    
    override protected function initialize():void {
        //Cc.bluecw(this, "initialize");
        super.initialize();
    }
    
    [Inspectable(defaultValue="10")]
    override public function get maximum():Number {
        //Cc.bluecw(this, "get maximum", super.maximum);
        return super.maximum;
    }
    
    override public function set maximum(value:Number):void {
        //Cc.bluecw(this, "set maximum", _maximum, ">", value,"currentFrame", currentFrame, "name", name,"this", this);
        super.maximum = value;
    }
    
    [Inspectable(defaultValue="0")]
    override public function get minimum():Number {
        //Cc.bluecw(this, "get minimum", super.minimum);
        return super.minimum;
    }
    
    override public function set minimum(value:Number):void {
        //Cc.bluecw(this, "set minmum", _minimum, ">", value);
        super.minimum = value;
    }
    
    [Inspectable(defaultValue="0")]
    override public function get value():Number {
        //Cc.bluecw(this, "get value", super.value);
        return super.value;
    }
    
    override public function set value(value:Number):void {
        //Cc.bluecw(this, "set value", super.value, _value, ">", value);
        super.value = value;
    }
    
    override public function get position():Number {
        //Cc.bluecw(this, "get position", super.position);
        return super.position;
    }
    
    override public function set position(value:Number):void {
        //Cc.bluecw(this, "set position", this.value, ">", value);
        super.position = value;
    }
    
    override protected function configUI():void {
        //Cc.bluecw(this, "configUI");
        super.configUI();
    }
    
    override protected function draw():void {
        //Cc.bluecw(this, "draw");
        super.draw();
        //Cc.purplec(this, "after draw WIDTH:", actualWidth, _width, _originalWidth);
        //Cc.purplec(this, "after draw _invalid:", _invalid, isInvalid(InvalidationType.SIZE), isInvalid(InvalidationType.DATA));
    }
    
    override public function setActualSize(newWidth:Number, newHeight:Number):void {
        //Cc.bluecw(this, "setActualSize", newWidth, newHeight);
        //Cc.purplec(this, "WIDTH", actualWidth, _width, newWidth);
        //Cc.purplec(this, "HEIGHT", actualHeight, _height, newHeight);
        super.setActualSize(newWidth, newHeight);
        //Cc.bluecw(this, "after setActualSize", actualWidth, actualHeight);
    }
    
    override public function setActualScale(scaleX:Number, scaleY:Number):void {
        //Cc.bluecw(this, "setActualScale", scaleX, scaleY);
        super.scaleX = scaleX;
        super.scaleY = scaleY;
        //Cc.blue("width", _width, _originalWidth, ">", _originalWidth * scaleX);
        _width = _originalWidth * scaleX;
        //Cc.blue("height", _height, _originalHeight, ">", _originalHeight * scaleY);
        _height = _originalHeight * scaleY;
        invalidateSize();
    }
    
    override protected function updatePosition():void {
        //Cc.bluecw(this, "updatePosition", enabled,"currentFrame", currentFrame, "name", name);
        if (!enabled) { return; }
        var percent:Number = (_value - _minimum) / (_maximum - _minimum);
        var nextFrame:int = Math.max(1, Math.round(percent * totalFrames));
    
        //Cc.blue("percent",percent,"nextFrame",nextFrame, "currentFrame", currentFrame);
        if(parent) //Cc.blue("parent.currentFrame",MovieClip(parent).currentFrame);
        if(parent && parent.parent) //Cc.blue("parent.parent.currentFrame",MovieClip(parent.parent).currentFrame);
    
        if(currentFrame != nextFrame) {
            //Cc.yellowc(this, "gotoAndStop", nextFrame);
            gotoAndStop(nextFrame);
        }
    }
    
    override protected function initSize():void {
        //Cc.bluecw(this, "initSize");
        var w:Number = (_width == 0) ? actualWidth : _width;
        var h:Number = (_height == 0) ? actualHeight : _height;
        super.scaleX = super.scaleY = 1;
        setSize(w,h);
    }
    
    override public function setSize(width:Number, height:Number):void {
        //Cc.bluecw(this, "setSize width:", _width, ">", width, "height:", _height, ">", height);
        super.setSize(width, height);
    }
    
    override public function set scaleX(value:Number):void {
        //Cc.bluecw(this, "scaleX", super.scaleX, ">", value);
        super.scaleX = value;
    }
    
    override public function set scaleY(value:Number):void {
        //Cc.bluecw(this, "scaleY", super.scaleY, ">", value);
        super.scaleY = value;
    }
    
    override public function get width():Number {
        //Cc.bluecw(this, "get super.width", super.width, "_width", _width, "actualWidth", actualWidth, "_originalWidth",_originalWidth);
        return super.width;
    }
    
    override public function set width(value:Number):void {
        //Cc.bluecw(this, "set width", super.width, ">", value);
        super.width = value;
    }
    
    override public function set height(value:Number):void {
        //Cc.bluecw(this, "set height", super.height, ">", value);
        super.height = value;
    }
    
    override public function invalidateSize():void {
        //Cc.bluecw(this, "invalidateSize");
        super.invalidateSize();
    }
    
    override public function invalidateData():void {
        //Cc.bluecw(this, "invalidateData");
        super.invalidateData();
    }
    
    override public function invalidateState():void {
        //Cc.bluecw(this, "invalidateState");
        super.invalidateState();
    }
    
    override public function invalidate(...invalidTypes:Array):void {
        //Cc.bluecw(this, "invalidate", invalidTypes);
        super.invalidate(invalidTypes);
    }
    
    override protected function isInvalid(...invalidTypes:Array):Boolean {
        //Cc.bluecw(this, "isInvalid", invalidTypes, "r:", super.isInvalid(invalidTypes));
        return super.isInvalid(invalidTypes);
    }
    
    override public function validateNow(event:Event = null):void {
        //Cc.bluecw(this, "validateNow", event);
        //Cc.purplec(this, "_invalid",_invalid,"_invalidHash", _invalidHash);
        super.validateNow(event);
        //Cc.purplec(this, "after super.validateNow _invalid",_invalid,"_invalidHash", _invalidHash);
    }
    
    override public function gotoAndStop(frame:Object, scene:String = null):void {
        //Cc.bluecw(this, "gotoAndStop", frame, scene,"currentFrame", currentFrame, "name", name);
        super.gotoAndStop(frame, scene);
    }
    
    override public function gotoAndPlay(frame:Object, scene:String = null):void {
        //Cc.bluecw(this, "gotoAndPlay", frame, scene,"currentFrame", currentFrame, "name", name);
        super.gotoAndPlay(frame, scene);
    }
    
    override protected function addedToStage(event:Event):void {
        //Cc.yellowcw(this, "addedToStage", event, DebugUtils.sizeToString(this));
        stage.addEventListener(DebugEvent.MINIMUM, handleDebugEvents);
        stage.addEventListener(DebugEvent.MAXIMUM, handleDebugEvents);
        stage.addEventListener(DebugEvent.VALUE, handleDebugEvents);
        stage.addEventListener(DebugEvent.POSITION, handleDebugEvents);
        //super.addedToStage(event);
    }
    
    protected function removedFromStage(event:Event):void {
        //Cc.yellowcw(this, "removedFromStage", event, DebugUtils.sizeToString(this));
        stage.removeEventListener(DebugEvent.MINIMUM, handleDebugEvents);
        stage.removeEventListener(DebugEvent.MAXIMUM, handleDebugEvents);
        stage.removeEventListener(DebugEvent.VALUE, handleDebugEvents);
        stage.removeEventListener(DebugEvent.POSITION, handleDebugEvents);
    }
}
}
