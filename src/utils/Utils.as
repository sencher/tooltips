package utils {
import com.adobe.serialization.json.JSON;
import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.LoaderInfo;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.system.ApplicationDomain;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.describeType;
import flash.utils.getQualifiedClassName;
import flash.utils.getQualifiedSuperclassName;

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
		
		public static function logJsonObject(value:*, channel:* = "logJson"):void{
			Cc.logch(channel, com.adobe.serialization.json.JSON.encode(value));
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
        
	    public static function drawBox(x:Number = 0, y:Number = 0, w:Number = 100, h:Number = 100, angle:Number = 0, color:uint = 0xcccccc, borderColor:uint = 0x000000):Shape
	    {
		    //trace("drawBox",arguments)
		    var box:Shape = new Shape();
		    box.graphics.lineStyle(1, borderColor, .75);
		    box.graphics.beginFill(color);
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
	
	    public static function globalVisible(displayObject:DisplayObject):Boolean {
		    var checking:DisplayObject = displayObject;
		    while(checking){
			    if(!checking.visible){
				    return false;
			    }else if(checking.parent){
				    checking = checking.parent;
			    }else{
				    return true;
			    }
		    }
		    return true;// to make Idea happy
	    }
	
	    public static function globalVisibleList(displayObject:DisplayObject):String {
		    var result:String = "globalVisibleList of :\n";
		    var checking:DisplayObject = displayObject;
		    while(checking){
			
			    result += getNameAndVisible(checking);
			
			    if(checking.parent){
				    checking = checking.parent;
			    }else{
				    return result;
			    }
		    }
		    return result;// to make Idea happy
	    }
	
	    public static function getNameAndVisible(displayObject:DisplayObject):String {
		    return displayObject + ", " + getQualifiedClassName(displayObject) + ", " + getQualifiedSuperclassName(displayObject) + ", " + displayObject.name + ", " + String(displayObject.visible).toUpperCase() + "\n";
	    }
	
	    public static function getTopParent(displayObject:DisplayObject):DisplayObject {
		    var checking:DisplayObject = displayObject;
		    while(checking.parent){
			    checking = checking.parent;
		    }
		    return checking;
	    }
		
		public static function setTextColor(textField:TextField, color:int):void {
			var textFormat:TextFormat = textField.getTextFormat();
			textFormat.color = color;
			textField.setTextFormat(textFormat);
		}
		
		public static function cutDecimals(num:Number, decimals:int):Number
		{
			var m:int = Math.pow(10, decimals);
			return Math.round(num * m) / m;
		}

        public static function checkFonts():void {
            var allFonts:Array = Font.enumerateFonts(true);
            allFonts.sortOn("fontName", Array.CASEINSENSITIVE);

            var embeddedFonts:Array = Font.enumerateFonts(false);
            embeddedFonts.sortOn("fontName", Array.CASEINSENSITIVE);

            trace("Fonts : embedded", embeddedFonts.length, "/ all", allFonts.length);
            for each (var i:Font in embeddedFonts){
                trace("\t" + fontParamsString(i));
            }
        }

        private static function fontParamsString(f:Font):String {
            return f.fontName + " / " + f.fontStyle + " / " + f.fontType;
        }

        public static function updateLabel(tf:TextField, str:String, html:Boolean = false):void {
            var stringForCheck:String = removeBuggedGlyphs(str);
            tf.embedFonts = true;
            var format:TextFormat = tf.getTextFormat();
            if(tf && format.font == null){
                tf.text = "123";
                format = tf.getTextFormat();
            }

            var font:Font = getFontObject(format.font);
            if (!font || !font.hasGlyphs(stringForCheck)){
                Cc.logchw("Font", format.font,"|", str, tf.name, missingGlyphs(font, stringForCheck));
                var defaultFont:Font = getFixedFont(format.font);
                if(!defaultFont.hasGlyphs(stringForCheck)){
                    Cc.warnchw("Font Error", fontParamsString(defaultFont),"|", str, missingGlyphs(defaultFont, stringForCheck));
                }else{
                    format.font = defaultFont.fontName;
                    tf.defaultTextFormat = format;
                    Cc.logchw("Font Fixed", fontParamsString(defaultFont),"|", str);
                }
            }

            html ? tf.htmlText = str : tf.text = str;
        }

        private static function getFixedFont(fontName:String):Font {
            var fixedFontString:String;
            switch (fontName){
                case DefaultValues.FONT_NAME_VAG_ROUNDED_BT:
                    fixedFontString = DefaultValues.FONT_NAME_VAG_ROUNDED_CYRILLIC;
                    break;
//            case DefaultValues.FONT_NAME_OFFICINA_SERIF:
//                fixedFontString = DefaultValues.FONT_NAME_OFFICINA_SERIF_CYRILLIC;
//                break;
                default:
//                fixedFontString = DefaultValues.FONT_NAME_ARIAL;
                    fixedFontString = DefaultValues.FONT_NAME_MYRIAD_PRO;
                    break;
            }

            return getFontObject(fixedFontString);
        }

        public static function getFontObject(fontString:String):Font {
            var fonts:Array = Font.enumerateFonts(false);
            var i:Font;
            for each (i in fonts){
                if(i.fontName == fontString){
                    return i;
                }
            }
            return null;
        }

        public static function missingGlyphs(font:Font, string:String):String
        {
            if(!font){
                return "No Embed font!";
            }
            string = removeBuggedGlyphs(string);

            var missing:String;
            if (! font.hasGlyphs(string))
            {
                var missingGlyphs:Object = new Object();
                missing = "";
                for (var i:uint = 0; i < string.length; ++i)
                {
                    var char:String = string.charAt(i);
                    var charCode:int = char.charCodeAt();
                    if (! font.hasGlyphs(char) && ! missingGlyphs[char])
                    {
                        missingGlyphs[char] = char;
                        missing += ((missing == "") ? "" : ", ") + "\"" + char + "\" [" + charCode + "]";
                    }
                }
            }

            return missing;
        }

        /**
         * Replaces all instances of the replace string in the input string
         * with the replaceWith string.
         *
         * @param input Original string
         * @param replace The string that will be replaced
         * @param replaceWith The string that will replace instances of replace
         * @returns A new String with the replace string replaced with replaceWith
         */
        public static function stringReplace(input:String, replace:String, replaceWith:String):String
        {
            return input.split(replace).join(replaceWith);
        }

        public static function removeBuggedGlyphs(string:String):String {
            // strip out line breaks etc, which can be problematic with font.hasGlyphs()
            string = stringReplace(string, ' ', '');	// strip out spaces
            string = stringReplace(string, '\n', '');	// remove new line
            string = stringReplace(string, '\r', '');	// remove return
            string = stringReplace(string, '\t', '');	// remove tabs
            return string;
        }

        public static function getDomainPrefix(loaderInfo:LoaderInfo):String {
            var prefix:String = getQualifiedClassName(loaderInfo.content);
            return prefix.substr(0, prefix.lastIndexOf(":") + 1);
        }

        public static function getQualifiedDefinitionNamesIgnorePrefix(domain:ApplicationDomain):Vector.<String> {
            var list:Vector.<String> = domain.getQualifiedDefinitionNames();
            var i:int;
            var currentString:String;
            for (i = 0; i < list.length; i++){
                currentString = list[i];
                list[i] = currentString.substr(currentString.lastIndexOf(":") + 1);
            }

            return list;
        }

        public static function hasDefinitionIgnorePrefix(domain:ApplicationDomain, value:String):Boolean {
            var list:Vector.<String> = getQualifiedDefinitionNamesIgnorePrefix(domain);
            return Boolean(list.indexOf(value));
        }

        public static function getDefinitionIgnorePrefix(domain:ApplicationDomain, value:String):Object {
            var list:Vector.<String> = getQualifiedDefinitionNamesIgnorePrefix(domain);
            var listFull:Vector.<String> = domain.getQualifiedDefinitionNames();
            return domain.getDefinition(listFull[list.indexOf(value)]);
        }
    }
}
