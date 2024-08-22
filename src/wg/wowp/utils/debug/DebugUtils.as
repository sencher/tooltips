package wowp.utils.debug {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;

import wowp.utils.domain.getDefinition;

public class DebugUtils {
    protected static var totalUniqueIds:int = 1;
    
    public static function delayCode(ms:Number):void {
        var delayStart:Number = getTimer();
        while (getTimer() - delayStart < ms) {
        }
    }
    
    public static function sizeToString(displayObject:DisplayObject):String {
        return "x: " + displayObject.x + ", y: " + displayObject.y +
                ", width: " + displayObject.width + ", height: " + displayObject.height +
                ", scaleX: " + displayObject.scaleX + ", scaleY: " + displayObject.scaleY;
    }
    
    public static function isInterestingObj(obj:Object):Boolean {
        if (obj) {
            var interesting:Array = [1102, 1402];
            var param:* = obj.planeID || obj.id;
            if (interesting.indexOf(param) > -1) return true;
        }
        return false;
    }
    
    public static function isInterestingString(value:String):Boolean {
        if (value) {
            var interesting:Array = ["n/a"];
            for each (var element:String in interesting) {
                if (value.indexOf(element) > -1) return true;
            }
        }
        return false;
    }
    
    public static function isInterestingSpriteName(value:Sprite):Boolean {
        if (value) {
//            Cc.redw("isInterestingSpriteName", value.name);
            var interesting:Array = ["button0", "button1", "button2"];
            for each (var element:String in interesting) {
                if (value.name == element) return true;
            }
        }
        return false;
    }
    
    public static function isInterestingSpriteParentName(value:Sprite):Boolean {
        if (value && value.parent) {
//            Cc.redw("isInterestingSpriteParentName", value.name);
            var interesting:Array = ["smallBarMemberButton1"];
            for each (var element:String in interesting) {
                if (value.parent.name == element) return true;
            }
        }
        return false;
    }
    
    public static function isInterestingSpriteClass(value:Sprite):Boolean {
        if (value) {
//            Cc.redw("isInterestingSpriteClass", value);
            var interesting:Array = ["TicketsWindowTabButton", "TicketsWindowButtonBar"];
            for each (var element:String in interesting) {
//                Cc.red(getDefinition(element));
                try {
                    if (value is getDefinition(element)) return true;
                } catch (e:Error) {
                }
            }
        }
        return false;
    }
    
    public static function set(label:String, previous:*, next:*, addName:String = ""):String {
        var result:String = label + ": " + JSON.stringify(previous) + " > " + JSON.stringify(next);
        if (addName) {
            result += " ; name: " + addName;
        }
        return result;
    }
    
    public static function shortInfo(value:*):String {
        if(value is Object){
            return getQualifiedClassName(value);
        }
        
        return value;
    }
    
    public static function getUniqueId():int {
        return totalUniqueIds++;
    }
}
}
