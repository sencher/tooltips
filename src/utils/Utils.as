package utils {
import com.adobe.serialization.json.JSON;
import com.junkbyte.console.Cc;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.system.ApplicationDomain;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Dictionary;
import flash.utils.describeType;
import flash.utils.getQualifiedClassName;

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

    public static function clone(source:*):* {
        var classAsXML:XML = describeType(source);
        var list:XMLList = classAsXML.*;
        var propMap:Object = new Object();
        var item:XML;

        for each (item in list) {
            var itemName:String = item.name().toString();
            switch (itemName) {
                case "variable":
                    propMap[item.@name.toString()] = item.@type.toString();
                    break;
                case "accessor":
                    var access:String = item.@access;
                    if ((access == "readwrite") || (access == "writeonly")) {
                        propMap[item.@name.toString()] = item.@type.toString();
                    }
                    break;
            }
        }

        var _class:Class = source.constructor;
        var result:* = new _class();

        for (var prop:String in propMap) {
//            if(propMap[prop] == "Array" || propMap[prop] == "Object"){
//                result[prop] = clone(source[prop]);
//            }else {
                result[prop] = source[prop];
//            }
        }
        return result;
    }


    public static function whoCalledThis(depth:int = 3):String {
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

    public static function logJsonObject(value:*, channel:* = "logJson"):void {
        Cc.logch(channel, com.adobe.serialization.json.JSON.encode(value));
    }

    public static function logFuncNameAndArgs(args:*):void {
        Utils.whoCalledThis();
        var param:*;
        for each (param in args) {
            Utils.logJsonObject(param);
        }
    }

    public static function generateRandomString(len:Number, russian:Boolean = false):String {
        var chars:String = russian ?
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789абвгдеёжзийклмнопрстуфхцчшщьыъэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ"
                : "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var num_chars:Number = chars.length - 1;
        var randomChar:String = "";

        for (var i:Number = 0; i < len; i++) {
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
        if (!prevArgsObject || !prevArgsObject.prevArgs || !prevArgsObject.prevArgs.length) {
            prevArgsObject.prevArgs = newArgs;
            return false;
        }

        var i:int;
        for (i = 0; i < prevArgsObject.prevArgs.length; i++) {
            if (newArgs[i] != prevArgsObject.prevArgs[i]) {
                prevArgsObject.prevArgs = newArgs;
                return false;
            }
        }
        return true;
    }

    public static function getRandom(min:int, max:int):int {
        return Math.floor(Math.random() * (max + 1 - min)) + min;
    }

    public static function drawBox(x:Number = 0, y:Number = 0, w:Number = 100, h:Number = 100, angle:Number = 0, color:uint = 0xcccccc, alpha:Number = 1, borderColor:uint = 0x000000):Shape {
        //trace("drawBox",arguments)
        var box:Shape = new Shape();
        box.graphics.lineStyle(1, borderColor, .75);
        box.graphics.beginFill(color);
//        box.graphics.drawRect(-w/2,-h/2,w,h);
        box.graphics.drawRect(0, 0, w, h);
        box.x = x;
        box.y = y;
        box.rotation = angle;
        box.alpha = alpha;

        return box;
    }

    public static function drawButton():Sprite {
        var s:Sprite = new Sprite();
        s.addChild(drawBox());
        return s;
    }

    public static function globalVisible(displayObject:DisplayObject):Boolean {
        var checking:DisplayObject = displayObject;
        var par:DisplayObject = checking.parent;
        while (checking) {
            if (!checking.visible || checking.alpha == 0) {
                return false;
            } else if (par) {
                checking = par;
                par = checking.parent;
            } else if (checking is Stage) {
                return true;
            } else {
                return false;
            }
        }
        return true;// to make Idea happy
    }

    public static function globalVisibleList(displayObject:DisplayObject):String {
        var result:String = "globalVisibleList of :\n";
        var checking:DisplayObject = displayObject;
        while (checking) {

            result += getNameAndVisible(checking);

            if (checking.parent) {
                checking = checking.parent;
            } else {
                return result;
            }
        }
        return result;// to make Idea happy
    }

    public static function getNameAndVisible(displayObject:DisplayObject):String {
        return displayObject.name + displayObject + " / visible:" + String(displayObject.visible).toUpperCase() + ", alpha:" + displayObject.alpha + "\n";
    }

    public static function setTextColor(textField:TextField, color:int):void {
        var textFormat:TextFormat = textField.getTextFormat();
        textFormat.color = color;
        textField.setTextFormat(textFormat);
    }

    public static function cutDecimals(num:Number, decimals:int):Number {
        var m:int = Math.pow(10, decimals);
        return Math.round(num * m) / m;
    }

    public static function checkFonts():void {
        var allFonts:Array = Font.enumerateFonts(true);
        allFonts.sortOn("fontName", Array.CASEINSENSITIVE);

        var embeddedFonts:Array = Font.enumerateFonts(false);
        embeddedFonts.sortOn("fontName", Array.CASEINSENSITIVE);

        trace("Fonts : embedded", embeddedFonts.length, "/ all", allFonts.length);
        for each (var i:Font in embeddedFonts) {
            trace("\t" + fontParamsString(i));
        }
    }

    private static function fontParamsString(f:Font):String {
        return f.fontName + " / " + f.fontStyle + " / " + f.fontType;
    }

//    public static function updateLabel(tf:TextField, str:String, html:Boolean = false):void {
//        //DEBUG
////            if(str.indexOf("Играть") > -1){
////                //DebugUtils.Cc("logchw", "updateLabel", arguments, Env.getDefaults().getKeysFromValue(str));
////                tf.border = true;
////                tf.background = true;
////                tf.backgroundColor = 0x880000;
////            }
//
//        tf.embedFonts = true;
//        var format:TextFormat = tf.getTextFormat();
//        if (tf && format.font == null) {
//            tf.text = "123";
//            format = tf.getTextFormat();
//        }
//
//        var fixedFont:Font = getFixedFont(format.font);
//        if (fixedFont) {
//            var stringForCheck:String = str.replace(/[\n\r\t ]/g, "");
//            format.font = fixedFont.fontName;
//            tf.defaultTextFormat = format;
//            tf.setTextFormat(format);
//            //            if (!fixedFont.hasGlyphs(stringForCheck)) {
//            //                Cc.logch("Font", format.font, "|", str, tf.name, missingGlyphs(fixedFont, stringForCheck));
//            //            }
//        }
//
//        if (html) {
//            tf.htmlText = str;
//            if (tf.htmlText != str) {
//                // TextField is set to text=htmlText="" if tags without quoted values
//                var htmlText:String = quoteHtmlParams(str);
//                tf.htmlText = htmlText;
//            }
//        } else {
//            tf.text = str;
//        }
//    }

    /**
     * Converting string like this: <p align=center>
     * to strings like that: <p align="center"> (Because TextField are ignore strings without quoted values)
     */
    private static const tagsRegExp:RegExp = / < ([^<]*) \/? > /ix;
    private static const paramsRegExp:RegExp = / ([a-z0-9]+) \s* = \s*  ([#a-z0-9]+) /ix;

    static public function quoteHtmlParams(html:String):String {
        var newHtml:String = '';
        while (html != '') {
            if (tagsRegExp.test(html)) {
                var tagsData:Object = tagsRegExp.exec(html);
                var tag:String = tagsData[0];
                var body:String = tagsData[1];

                var i:int = html.indexOf(tag);
                if (i > 0) {
                    newHtml += html.substr(0, i);
                    html = html.substr(i);
                }
                html = html.replace(tag, '');

                while (paramsRegExp.test(body)) {
                    var bodyData:Object = paramsRegExp.exec(body);
                    var all:String = bodyData[0];
                    var param:String = bodyData[1];
                    var value:String = bodyData[2];

                    body = body.replace(all, param + '="' + value + '"');
                }

                newHtml += '<' + body + '>';
            } else {
                newHtml += html;
                html = '';
            }
        }

        return newHtml;
    }

//    private static function getFixedFont(fontName:String):Font {
//        var fixedFontString:String;
//        switch (fontName) {
//            case DefaultValues.FONT_NAME_VAG_ROUNDED_BT:
//                fixedFontString = DefaultValues.FONT_NAME_VAG_ROUNDED_CYRILLIC;
//                break;
////            case DefaultValues.FONT_NAME_OFFICINA_SERIF:
////                fixedFontString = DefaultValues.FONT_NAME_OFFICINA_SERIF_CYRILLIC;
////                break;
//            default:
////                fixedFontString = DefaultValues.FONT_NAME_ARIAL;
//                fixedFontString = DefaultValues.FONT_NAME_MYRIAD_PRO;
//                break;
//        }
//
//        return getFontObject(fixedFontString);
//    }

    public static function getFontObject(fontString:String):Font {
        var fonts:Array = Font.enumerateFonts(false);
        var i:Font;
        for each (i in fonts) {
            if (i.fontName == fontString) {
                return i;
            }
        }
        return null;
    }

    public static function missingGlyphs(font:Font, string:String):String {
        if (!font) {
            return "No Embed font!";
        }
        string = removeBuggedGlyphs(string);

        var missing:String;
        if (!font.hasGlyphs(string)) {
            var missingGlyphs:Object = new Object();
            missing = "";
            for (var i:uint = 0; i < string.length; ++i) {
                var char:String = string.charAt(i);
                var charCode:int = char.charCodeAt();
                if (!font.hasGlyphs(char) && !missingGlyphs[char]) {
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
    public static function stringReplace(input:String, replace:String, replaceWith:String):String {
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

    public static function getPrefix(value:*):String {
        var prefix:String = getQualifiedClassName(value);
        return prefix ? prefix.substr(0, prefix.lastIndexOf(":") + 1) : null;
    }

    public static function getQualifiedDefinitionNamesIgnorePrefix(domain:ApplicationDomain = null):Vector.<String> {
        if (!domain) domain = ApplicationDomain.currentDomain;
        var list:Vector.<String> = domain.getQualifiedDefinitionNames();
        var i:int;
        var currentString:String;
        for (i = 0; i < list.length; i++) {
            currentString = list[i];
            list[i] = currentString.substr(currentString.lastIndexOf(":") + 1);
        }

        return list;
    }

    public static function hasDefinitionIgnorePrefix(value:String, domain:ApplicationDomain = null):Boolean {
        if (!domain) domain = ApplicationDomain.currentDomain;
        var list:Vector.<String> = getQualifiedDefinitionNamesIgnorePrefix(domain);
        return Boolean(list.indexOf(value));
    }

    public static function getDefinitionIgnorePrefix(value:String, domain:ApplicationDomain = null):Object {
        if (!domain) domain = ApplicationDomain.currentDomain;
        var listShort:Vector.<String> = getQualifiedDefinitionNamesIgnorePrefix(domain);
        var listFull:Vector.<String> = domain.getQualifiedDefinitionNames();
        var id:Number = listShort.indexOf(value);
        return id > -1 ? domain.getDefinition(listFull[id]) : null;
    }

    public static function getIndexes(array:Array, value:*):Array {
        var result:Array = [];
        var currentId:int;
        var previousId:int = 0;

        do {
            currentId = array.indexOf(value, previousId);
            if (currentId > -1) {
                result.push(currentId);
                previousId = currentId + 1;
            }
        } while (currentId > -1);

        return result;
    }

    public static function safeVector2dCheck(v:*, d1:int, d2:int):Boolean {
        try {
            v[d1][d2];
        } catch (e:Error) {
            return false;
        }

        return true;
    }

    public static function traceDictionaryKeys(d:Dictionary):void {
        var a:Array = [];
        for (var key:Object in d) {
            a.push(key);
        }

        trace(a);
    }

    public static function childList(container:DisplayObjectContainer):String {
        var s:String = describeDisplayObject(container);
        var displayObject:DisplayObject;
        for (var i:int = 0; i < container.numChildren; i++) {
            displayObject = container.getChildAt(i);
            s += "\t" + describeDisplayObject(displayObject);
        }
        return s;
    }

    private static function describeDisplayObject(value:DisplayObject):String {
        return value.name + " / " + DomainUtils.getTypeIgnorePrefix(value) + "\n";
    }

    public static function removeNullElements(value:Array):Array {
        for (var i:int = value.length - 1; i > -1; i--) {
            if (!value[i]) {
                value.splice(i, 1);
            }
        }
        return value;
    }

    public static function getCommonParent(main:DisplayObject, others:Array):DisplayObjectContainer {
        if (!others || !others.length) {
            return null;
        }

        var mainList:Vector.<DisplayObjectContainer> = getAllParents(main);
        var checkList:Vector.<DisplayObjectContainer>;

        for (var i:int = 0; i < others.length; i++) {
            checkList = getAllParents(others[i]);

            for each(var nextMainParent:DisplayObjectContainer in mainList) {
                if (checkList.indexOf(nextMainParent) > -1) {
                    break;
                } else {
                    mainList.shift();
                }
            }

        }

        return mainList[0] ? mainList[0] : null;
    }

    public static function getTopParent(displayObject:DisplayObject):DisplayObject {
        var checking:DisplayObject = displayObject;
        while (checking.parent) {
            checking = checking.parent;
        }
        return checking;
    }

    public static function getAllParents(displayObject:DisplayObject):Vector.<DisplayObjectContainer> {
        var list:Vector.<DisplayObjectContainer> = new Vector.<DisplayObjectContainer>();
        var checking:DisplayObject = displayObject;
        while (checking.parent) {
            list.push(checking.parent);
            checking = checking.parent;
        }
        return list;
    }
	
	public static function averageOfArray(array:Array):Number
	{
		var sum:Number = 0;
		for each (var item:Number in array) {
			sum += item;
		}
		return sum / array.length;
	}
	
    /*
        Counts all elements in two-dimensional array
     */
	public static function numChildrenArray(array:Array):Number
	{
		var sum:Number = 0;
		for (var i:int = 0; i < array.length; i++) {
			if (array[i] is Array && array.length) {
				for (var j:int = 0; j < array[i].length; j++) {
					if (array[i][j]) {
						sum++;
					}
				}
			}
		}
        return sum;
	}
	
	public static function joinArrays(main:Array, additional:Array, clearAdditional:Boolean = true):Array
	{
		main = main.concat(additional);
		if (clearAdditional) {
			clearLinkedArray(additional);
		}
		return main;
	}
	
	private static function clearLinkedArray(array:Array):void
	{
        var length:int = array.length;
		for (var i:int = 0; i < length; i++) {
			array.shift();
		}
	}
}
}
