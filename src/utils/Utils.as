package utils {

import com.adobe.serialization.json.JSON;
import com.junkbyte.console.Cc;
import com.junkbyte.console.core.ConsoleUtils;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Graphics;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.geom.Point;
import flash.system.ApplicationDomain;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextLineMetrics;
import flash.utils.Dictionary;
import flash.utils.describeType;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;

public class Utils {
    public static function trEvent(event:Event):void {
        trace(event.currentTarget.name, event.type);
    }
    
    public static function trAllChilds(mc:MovieClip):void {
        for (var i:uint = 0; i < mc.numChildren; i++) {
            trace('\t|\t ' + i + '.\t name:' + mc.getChildAt(i).name + '\t type:' + typeof (mc.getChildAt(i)) + '\t' + mc.getChildAt(i));
        }
    }
    
    public static function mergeObjects(receiver:Object, source:Object, overrideMain:Boolean = false):void {
        var classAsXML:XML = describeType(receiver);
        if (classAsXML.@isDynamic.toString() == "true") {
            var i:Object;
            for (i in source) {
                if (overrideMain || !receiver[i]) {
                    receiver[i] = source[i];
                }
            }
        } else {
            var list:XMLList = classAsXML.*;
            var propMap:Object = new Object();
            var item:XML;
            
            for each (item in list) {
                var itemType:String = item.name().toString();
                var itemName:String = item.@name.toString();
                var itemAccess:String = item.@access.toString();
                if (itemName == "metaData" || (itemType == "accessor" && itemAccess != "readwrite")) continue;
                
                switch (itemType) {
                    case "variable":
                    case "accessor":
                        if (source.hasOwnProperty(itemName)) {
                            if (overrideMain || !receiver[itemName]) {
                                receiver[itemName] = source[itemName];
                            }
                        }
                        propMap[item.@name.toString()] = item.@type.toString();
                        break;
                }
            }
        }
    }
    
    public static function substractObjects(receiver:Object, source:Object):void {
        var i:Object;
        for (i in source) {
            delete receiver[i];
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
            if (propMap[prop] == "Array" || propMap[prop] == "Object") {
                result[prop] = clone(source[prop]);
            } else {
                result[prop] = source[prop];
            }
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
        Cc.green2(r);
        return r;
    }
    
    public static function logJsonObject(value:*, channel:* = "logJson"):void {
        Cc.green2c(channel, ConsoleUtils.formatJsonString(com.adobe.serialization.json.JSON.encode(value)));
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
    
    public static function splitStringIntoNumbersArray(value:String, delim:*):Array {
        if (!value) {
            return [];
        }
        var array:Array = value.split(delim);
        var n:int = array.length;
        while (n--) {
            array[n] = Number(array[n])
        }
        return array;
    }
    
    public static function getRandom(min:int, max:int, exclude:Array = null):int {
        if (exclude && exclude.length) {
            var pool:Array = [];
            for (var i:int = min; i < max + 1; i++) {
                if (exclude.indexOf(i) < 0) {
                    pool.push(i);
                }
            }
            
            if (pool.length < 1) {
                return 0;
            } else {
                return pool[Math.floor(Math.random() * (pool.length))];
            }
        } else {
            return Math.floor(Math.random() * (max + 1 - min)) + min;
        }
    }
    
    public static function createBox(x:Number = 0, y:Number = 0, w:Number = 100, h:Number = 100, angle:Number = 0, color:uint = 0xcccccc, alpha:Number = 1, border:Boolean = true, borderColor:uint = 0x000000):Shape {
        //trace("createBox",arguments)
        var box:Shape = new Shape();
        if (border) box.graphics.lineStyle(1, borderColor, .75);
        box.graphics.beginFill(color);
//        box.graphics.drawRect(-w/2,-h/2,w,h);
        box.graphics.drawRect(0, 0, w, h);
        box.x = x;
        box.y = y;
        box.rotation = angle;
        box.alpha = alpha;
        
        return box;
    }
    
    public static function createButton(x:Number = 0, y:Number = 0, w:Number = 100, h:Number = 100, angle:Number = 0, color:uint = 0xcccccc, alpha:Number = 1, border:Boolean = true, borderColor:uint = 0x000000):Sprite {
        var s:Sprite = new Sprite();
        s.addChild(createBox(x, y, w, h, angle, color, alpha, border, borderColor));
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
    
    public static function removeTabsAndNewLines($str:String):String {
        var rex:RegExp = /(\t|\n|\r)/gi;
        $str = $str.replace(rex, '');
        return $str;
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
    
    public static function averageOfArray(array:Array):Number {
        var sum:Number = 0;
        for each (var item:Number in array) {
            sum += item;
        }
        return sum / array.length;
    }
    
    /*
        Counts all elements in two-dimensional array
     */
    public static function numChildrenArray(array:Array):Number {
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
    
    public static function joinArrays(main:Array, additional:Array, clearAdditional:Boolean = true):Array {
        main = main.concat(additional);
        if (clearAdditional) {
            clearLinkedArray(additional);
        }
        return main;
    }
    
    private static function clearLinkedArray(array:Array):void {
        var length:int = array.length;
        for (var i:int = 0; i < length; i++) {
            array.shift();
        }
    }
    
    public static function setPrecision(number:Number, precision:int):Number {
        precision = Math.pow(10, precision);
        return Math.round(number * precision) / precision;
    }
    
    private static var textField:TextField;
    
    public static function traceTfInit(value:Stage):void {
        var textFormat:TextFormat = new TextFormat();
        textFormat.size = 20;
        textField = new TextField();
        textField.setTextFormat(textFormat);
        textField.defaultTextFormat = textFormat;
        textField.wordWrap = true;
        textField.width = value.stageWidth;
        textField.height = value.stageHeight;
        value.addChild(textField);
    }
    
    public static function traceTf(...value):void {
        textField.appendText(value + "\n");
        textField.scrollV = textField.maxScrollV;
    }
    
    public static function areArraysEqual(a:Array, b:Array):Boolean {
        if (a.length != b.length) {
            return false;
        }
        var len:int = a.length;
        for (var i:int = 0; i < len; i++) {
            if (a[i] !== b[i]) {
                return false;
            }
        }
        return true;
    }
    
    public static function traceArrayWithIndexes(value:*):void {
        var result:String = "***\n";
        for (var key:* in value) {
            result += "[" + key + "]" + value[key] + "\n";
        }
        trace(result);
    }
    
    public static function isNumber(value:String):Boolean {
        return /[0-9]/.test(value);
    }
    
    public static function isUpperCase(value:String):Boolean {
        return /[A-Z]/.test(value);
    }
    
    public static function isLowerCase(value:String):Boolean {
        return /[a-z]/.test(value);
    }
    
    public static function patternOccurrences(pattern:String, target:String):uint {
        return target.match(new RegExp(pattern, "g")).length;
    }
    
    public static function patternOccurrencesOverlayed(pattern:String, target:String):uint {
        var counter:int = 0;
        for (var i:int = 0; i < target.length; i++) {
            if (target.substr(i, pattern.length) == pattern) {
                counter++;
            }
        }
        return counter;
    }
    
    public static function pushIgnoreIfExist(storage:*, newElement:*):void {
        if (storage.indexOf(newElement) < 0) {
            storage.push(newElement);
        }
    }
    
    public static function delayCode(ms:Number):void {
        var delayStart:Number = getTimer();
        while (getTimer() - delayStart < ms) {
        }
    }
    
    public static function addConsole(stage:Stage):void {
        Cc.start(stage);
        Cc.commandLine = true;
        Cc.config.commandLineAllowed = true;
        Cc.config.commandLineAutoScope = true;
        Cc.visible = true;
        var halfWidth:Number = stage.stageWidth / 2;
        Cc.x = halfWidth
        Cc.width = halfWidth;
        Cc.height = stage.stageHeight;
    }
    
    public static function relativeAlignTextField(staticTF:TextField, dynamicTF:TextField):void {
        var m1:TextLineMetrics = staticTF.getLineMetrics(0);
        var m2:TextLineMetrics = dynamicTF.getLineMetrics(0);
        var center1:Number = m1.x + m1.width / 2;
        var center2:Number = m2.x + m2.width / 2;

//        var b1 = createBox(center1, staticTF.y, 1, staticTF.height, 0, 0xaa0000, 1, false);
//        staticTF.parent.addChild(b1);
//        var bg = createBox(m1.x, staticTF.y, m1.width, m1.height);
//        staticTF.parent.addChildAt(bg, 0);
        
        dynamicTF.x += center1 - center2;

//        var b1 = createBox(center2, dynamicTF.y, 1, dynamicTF.height, 0, 0xaa0000, 1, false);
//        staticTF.parent.addChild(b1);
//        var bg = createBox(m2.x, dynamicTF.y, m2.width, m2.height);
//        staticTF.parent.addChildAt(bg, 0);
    }
    
    public static function drawGrid(stage:Stage, step:int):void {
        var container:Sprite = new Sprite();
        var l:Shape;
        for (var x:int = 0; x < stage.stageWidth; x += step) {
            l = createLine(x, 0, x, stage.stageHeight, x % (step * 10) == 0 ? 0xAA0000 : 0xCCCCCC);
            container.addChild(l);
        }
        
        for (var y:int = 0; y < stage.stageHeight; y += step) {
            l = createLine(0, y, stage.stageWidth, y, y % (step * 10) == 0 ? 0xAA0000 : 0xCCCCCC);
            container.addChild(l);
        }
        
        stage.addChildAt(container, 0);
    }
    
    public static function createLine(xStart:Number = 0, yStart:Number = 0, xEnd:Number = 100, yEnd:Number = 100, color:uint = 0xcccccc, alpha:Number = 1):Shape {
        //trace("createBox",arguments)
        var line:Shape = new Shape();
        var g:Graphics = line.graphics;
        g.lineStyle(1, color, alpha);
        g.moveTo(xStart, yStart);
        g.lineTo(xEnd, yEnd);

//        box.graphics.beginFill(color);
////        box.graphics.drawRect(-w/2,-h/2,w,h);
//        box.graphics.drawRect(0, 0, w, h);
//        box.x = x;
//        box.y = y;
//        box.rotation = angle;
//        box.alpha = alpha;
        
        return line;
    }
    
    private static function getMetrics(displayObj:DisplayObject):Metrics {
        var m:Metrics = new Metrics();
        
        if (displayObj is TextField) {
            var textMetrics:TextLineMetrics = TextField(displayObj).getLineMetrics(0);
            Utils.mergeObjects(m, textMetrics, true);
        } else {
            Utils.mergeObjects(m, displayObj, true);
        }
        return m;
    }
    
    public static function alignToDisplayObjectHorizoltally(alignedObj:DisplayObject, staticObj:DisplayObject):void {
        var alignedMetrics:Metrics = getMetrics(alignedObj);
        var staticMetrics:Metrics = getMetrics(staticObj);
        var alignedCenter:Number = alignedObj.localToGlobal(new Point(alignedMetrics.width / 2, 0)).x;
        var staticCenter:Number = staticObj.localToGlobal(new Point(staticMetrics.width / 2, 0)).x;
        alignedObj.x += staticCenter - alignedCenter;
    }
    
    public static function alignToDisplayObjectVertically(alignedObj:DisplayObject, staticObj:DisplayObject):void {
        var alignedMetrics:Metrics = getMetrics(alignedObj);
        var staticMetrics:Metrics = getMetrics(staticObj);
        var alignedCenter:Number = alignedObj.localToGlobal(new Point(0, alignedMetrics.height / 2)).y;
        var staticCenter:Number = staticObj.localToGlobal(new Point(0, staticMetrics.height / 2)).y;
        alignedObj.y += staticCenter - alignedCenter;
    }
    
    public static function alignToDisplayObjectBoth(alignedObj:DisplayObject, staticObj:DisplayObject):void {
        var alignedMetrics:Metrics = getMetrics(alignedObj);
        var staticMetrics:Metrics = getMetrics(staticObj);
        var alignedCenter:Point = alignedObj.localToGlobal(new Point(alignedMetrics.width / 2, alignedMetrics.height / 2));
        var staticCenter:Point = staticObj.localToGlobal(new Point(staticMetrics.width / 2, staticMetrics.height / 2));
        alignedObj.x += staticCenter.x - alignedCenter.x;
        alignedObj.y += staticCenter.y - alignedCenter.y;
    }
}
}

class Metrics {
    public var x:Number;
    public var y:Number;
    public var width:Number;
    public var height:Number;
    
    function Metrics(x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    
    public function get centerX():Number {
        return x + width / 2;
    }
    
    public function get centerY():Number {
        return y + height / 2;
    }
    
    public function toString():String {
        return "x: " + x + ", y: " + y + ", width: " + width + ", height: " + height;
    }
}