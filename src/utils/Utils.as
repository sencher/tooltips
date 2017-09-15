package utils {
import com.adobe.serialization.json.JSON;
import com.junkbyte.console.Cc;
	
	import flash.display.DisplayObject;
	
	import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
    import flash.utils.describeType;

    public class Utils {
        public static function trEvent(event:Event):void {
            trace(event.currentTarget.name, event.type);
        }

        public static function trAllChilds(mc:MovieClip):void {
            for (var i:uint = 0; i < mc.numChildren; i++) {
                trace('\t|\t ' + i + '.\t name:' + mc.getChildAt(i).name + '\t type:' + typeof (mc.getChildAt(i)) + '\t' + mc.getChildAt(i));
            }
        }


        public static function mergeObjects(main:Object, second:Object, override:Boolean = false):void {
            var i:Object;
            for (i in second) {
                if (override || !main[i]) {
                    main[i] = second[i];
                }
            }
        }

        public static function substractObjects(main:Object, second:Object):void {
            var i:Object;
            for (i in second) {
                delete main[i];
            }
        }

        public static function clone(source:*):*{
            var classAsXML:XML = describeType(source);
            var list : XMLList = classAsXML.*;
            var propMap : Object = new Object();
            var item : XML;

            for each (item in list) {
                var itemName : String = item.name().toString();
                switch(itemName) {
                    case "variable":
                        propMap[item.@name.toString()] = item.@type.toString();
                        break;
                    case "accessor":
                        var access : String = item.@access;
                        if((access == "readwrite") || (access == "writeonly")) {
                            propMap[item.@name.toString()] = item.@type.toString();
                        }
                        break;
                }
            }

            var _class:Class = source.constructor;
            var result:* = new _class();

            for (var prop:String in propMap){
                result[prop] = source[prop];
            }
            return result;
        }


        public static function whoCalledThis(depth:int = 3):String{
            var e:Error = new Error();
            var stackTrace:String = e.getStackTrace();
            var lines:Array = stackTrace.split("\n\t");
            var cut:Array = lines.slice(3, 3 + depth);
            var s:String;
            var r:String = "";
            for each (s in cut) {
                r += s + "\n";
            }
            r += "*************";
            Cc.log(r);
            return r;
        }

        public static function logJsonObject(value:*):void{
            Cc.log(com.adobe.serialization.json.JSON.encode(value));
        }

        public static function logFuncNameAndArgs(args:*):void{
            Utils.whoCalledThis();
            var param:*;
            for each (param in args){
                Utils.logJsonObject(param);
            }
        }

        public static function generateRandomString(len:Number):String{
            var chars:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var num_chars:Number = chars.length - 1;
            var randomChar:String = "";

            for (var i:Number = 0; i < len; i++){
                randomChar += chars.charAt(Math.floor(Math.random() * num_chars));
            }
            return randomChar;
        }

        /*
        	Compares 2 argument Arrays. Saves new to previous if different.

            newArgs - "arguments" from your method
            prevArgsObject - Just pass local INITED empty object here

         */
        public static function sameAsPreviousArgs(newArgs:Array, prevArgsObject:Object):Boolean {
            if(!prevArgsObject || !prevArgsObject.prevArgs || !prevArgsObject.prevArgs.length){
                prevArgsObject.prevArgs = newArgs;
                return false;
            }

            var i:int;
            for (i = 0; i < prevArgsObject.prevArgs.length; i++){
                if(newArgs[i] != prevArgsObject.prevArgs[i]) {
                    prevArgsObject.prevArgs = newArgs;
                    return false;
                }
            }
            return true;
        }

        public static function getRandom(min:int, max:int):int{
            return Math.floor(Math.random() * (max + 1 - min)) + min;
        }
        
	    public static function drawBox(x:Number = 100, y:Number = 100, w:Number = 200, h:Number = 200, angle:Number = 0, color:uint = 0xffff00):Shape
	    {
		    //trace("drawBox",arguments)
		    var box:Shape = new Shape();
		    box.graphics.lineStyle(1, color, .75);
		    box.graphics.beginFill(0xcccccc);
//        box.graphics.drawRect(-w/2,-h/2,w,h);
		    box.graphics.drawRect(0,0,w,h);
		    box.x = x;
		    box.y = y;
		    box.rotation = angle;
		
		    return box;
	    }
	
	    public static function drawButton():Sprite {
            var s:Sprite = new Sprite();
            s.addChild(drawBox());
            return s;
	    }
	
	    public static function globalVisibleList(displayObject:DisplayObject):String {
		    var result:String = "";
		    var checking:DisplayObject = displayObject;
		    while(checking){
			
			    result += getNameAndVisible(checking);
			
			    if(checking.parent){
				    checking = checking.parent;
			    }else{
				    return result;
			    }
		    }
		    return null;// to make Idea happy
	    }
	
	    public static function getNameAndVisible(displayObject:DisplayObject):String {
		    return displayObject + ", " + displayObject.name + ", " + displayObject.visible + "\n";
	    }
    }
}
