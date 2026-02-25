package wowp.utils {

import com.junkbyte.console.Ct;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;

public class MovieClipUtils {
    public function MovieClipUtils() {
    }
    
    public static function gotoAndPlay(mc:MovieClip, label:String):void {
        if (mc.currentLabel != label) {
            mc.gotoAndPlay(label);
        }
    }
    
    public static function gotoAndStop(mc:MovieClip, label:String):void {
        if (mc.currentLabel != label) {
//            Cc.tealc("MovieClipUtils", "gotoAndStop", DebugUtils.set("label", mc.currentLabel, label));
            mc.gotoAndStop(label);
        }
    }
    
    public static function getChildList(value:*):String {
        var result:String = description(value);
        for (var i:uint = 0; i < value.numChildren; i++) {
            result += '\t|\t ' + i + '.\t ' + description(value.getChildAt(i));
        }
        return result;
    }
    
    public static function getParentList(value:DisplayObject):String {
        var result:String = description(value) + "\n";
        if (value.parent) {
            result = getParentList(value.parent) + result;
        }
        return result;
    }
    
    public static function description(value:DisplayObject):String {
        return "name:" + value.name + '\t type:' + typeof (value) + '\t' + value;
    }
    
    private static const ENTER_FRAME_LIMIT:int = 500;
    private static var dictionary:Dictionary = new Dictionary();
    
    public static function addEnterFrame(value:Sprite, comment:String = ""):void {
        dictionary[value] = new _enterFrameData(comment);
        value.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }
    
    public static function removeEnterFrame(value:Sprite):void {
        delete dictionary[value];
        value.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }
    
    public static function uniqueId(value:Sprite):int {
        var data:_enterFrameData = dictionary[value];
        return data ? data.uniqueId : -1;
    }
    
    private static function enterFrameHandler(event:Event = null):void {
        var target:* = event.target;
        var data:_enterFrameData = dictionary[target];
        
        if (++data.counter >= ENTER_FRAME_LIMIT) {
            data.counter = 0;
            Ct.orange(data.comment, "currentFrame:", target.currentFrame, "currentFrameLabel:", target.currentFrameLabel, "name:", target.name, "uniqueId:", data.uniqueId);
            Ct.white(MovieClipUtils.getParentList(target));
        }
    }
    
}
}

import wowp.utils.debug.DebugUtils;

class _enterFrameData {
    public var counter:int = 0;
    public var uniqueId:int;
    public var comment:String;
    
    public function _enterFrameData(comment:String = ""):void {
        this.comment = comment;
        uniqueId = DebugUtils.getUniqueId();
    }
}
