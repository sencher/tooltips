package utils.wg.debug {

import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.utils.getTimer;

import wowp.utils.domain.createObject;

import wowp.utils.domain.getDefinition;

public class DebugUtils {
    public static function delayCode(ms:Number):void{
        var delayStart:Number = getTimer();
        while (getTimer() - delayStart < ms){
        }
    }
    
    public static function sizeToString(displayObject:DisplayObject):String{
        return "x: " + displayObject.x + ", y: " + displayObject.y +
                ", width: " + displayObject.width + ", height: " + displayObject.height +
                ", scaleX: " + displayObject.scaleX + ", scaleY: " + displayObject.scaleY;
    }
    
    public static function isInterestingObj(obj:Object):Boolean {
        if(obj){
            var interesting:Array = [1102, 1402];
            var param:* = obj.planeID || obj.id;
            if(interesting.indexOf(param) > -1) return true;
        }
        return false;
    }
    
    public static function isInterestingString(value:String):Boolean{
        if(value){
            var interesting:Array = ["bf109", "JAFEB"];
            for each (var element:String in interesting){
                if(value.indexOf(element) > -1) return true;
            }
        }
        return false;
    }
    
    public static function isInterestingSpriteName(value:Sprite):Boolean {
        if (value) {
//            Cc.warnw("isInterestingSpriteName", value.name);
            var interesting:Array = ["button0", "button1", "button2"];
            for each (var element:String in interesting) {
                if (value.name == element) return true;
            }
        }
        return false;
    }
    
    public static function isInterestingSpriteParentName(value:Sprite):Boolean{
        if(value && value.parent){
//            Cc.warnw("isInterestingSpriteParentName", value.name);
            var interesting:Array = ["smallBarMemberButton1"];
            for each (var element:String in interesting){
                if(value.parent.name == element) return true;
            }
        }
        return false;
    }
    
    public static function isInterestingSpriteClass(value:Sprite):Boolean{
        if(value){
//            Cc.warnw("isInterestingSpriteClass", value);
            var interesting:Array = ["TicketsWindowTabButton", "TicketsWindowButtonBar"];
            for each (var element:String in interesting){
//                var _class:Class = getDefinition(element);
//                Cc.warn(_class);
                try {
                    if(value is getDefinition(element)) return true;
                }catch (e:Error) {
                
                }
                
            }
        }
        return false;
    }
    
    public static function set(previous:*, next:*):String{
        return previous + " > " + next;
    }
}
}
