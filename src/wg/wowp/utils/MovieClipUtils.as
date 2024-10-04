package wowp.utils {

import com.junkbyte.console.Ct;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;

import wowp.utils.debug.DebugUtils;
import wowp.utils.domain.getClassName;
import wowp.utils.domain.getSuperclassName;

public class MovieClipUtils {
    public static const TAB:String = "    ";
    
    private static var dictionary:Dictionary = new Dictionary(true);
    public static const DEFAULT_FRAMES_FREQUENCY:int = 200;
    
    public function MovieClipUtils() {
    }
    
    public static function gotoAndPlay(mc:MovieClip, label:String):void {
        if (mc.currentLabel != label) {
            mc.gotoAndPlay(label);
        }
    }
    
    public static function gotoAndStop(mc:MovieClip, label:String):void {
        if (mc.currentLabel != label) {
//            Cc.tealc("MovieClipUtils", "gotoAndStop", Cc.set("label", mc.currentLabel, label));
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
        var framesInfo:String = "";
        if (value is MovieClip) {
            var mc:MovieClip = MovieClip(value);
            framesInfo = TAB + "f:" + mc.currentFrame + (mc.currentFrameLabel ? TAB + "fL:" + mc.currentFrameLabel : "");
        }
        
        return DebugUtils.uid(value) +
                TAB + "name:" + value.name +
                framesInfo +
                TAB + "cls:" + getClassName(value) +
                TAB + "sup:" + getSuperclassName(value);
    }
    
    public static function addEnterFrame(value:Sprite, comment:String = "", frequency:int = DEFAULT_FRAMES_FREQUENCY, uid:int = 0):void {
//        return;
        if (!value) return;
//        Cc.redcw("MovieClipUtils", "addEnterFrame value:", value, "comment:", comment, "frequency:", frequency, "uid:", uid);
        
        if (!comment) comment = String(value);
        
        var _uid:int = uid || value.hasOwnProperty("uid") ? value["uid"] : DebugUtils.uid(value);
        dictionary[value] = new _enterFrameData(comment, frequency, _uid);
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
        
        if (++data.counter >= data.frequency) {
            data.counter = 0;
            Ct.orange(data.comment || "", description(target));
            Ct.white(MovieClipUtils.getParentList(target));
        }
    }
    
    /*  Return true if :
     displayObject.stage != null
     displayObject.visible = true
     all parents.visible = true
     */
    public static function isVisible(displayObject:DisplayObject):Boolean {
        if (displayObject.stage == null || displayObject.visible == false) return false;
        
        if (displayObject.parent != null && isVisible(displayObject.parent) == false) {
            return false;
        }
        return true;
    }
    
    public static function findMovieClipsByName(container:*, findString:String):Vector.<MovieClip> {
        var result:Vector.<MovieClip> = new Vector.<MovieClip>();
        
        if (!(container is DisplayObjectContainer)) return result;
        
        if (container.name == findString) {
            result.push(container);
        }
        var currentObject:*;
        for (var i:int = 0; i < container.numChildren; i++) {
            currentObject = container.getChildAt(i);
            if (!(currentObject is DisplayObjectContainer)) return result;
            
            if (currentObject.name == findString) {
                result.push(currentObject);
            }
            
            //the condition in the line below checks if object has any more children
            VectorHelper.merge(result, findMovieClipsByName(currentObject, findString), true);
        }
        return result;
    }
    
}
}

import wowp.utils.MovieClipUtils;
import wowp.utils.debug.DebugUtils;

class _enterFrameData {
    public var counter:int = 0;
    public var uniqueId:int;
    public var comment:String;
    public var frequency:int;
    
    public function _enterFrameData(comment:String = "", frequency:int = MovieClipUtils.DEFAULT_FRAMES_FREQUENCY, uid:int = 0):void {
//        Cc.redcw(this, "_enterFrameData.cons comment:", comment, "frequency:", frequency, "uid:", uid);
        uniqueId = uid || DebugUtils.getUniqueId();
        this.comment = comment;
        this.frequency = frequency;
    }
}
