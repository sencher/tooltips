package com.junkbyte.console.core {

public class ConsoleUtils {
    private static const OPEN_BRACE:String = "{";
    private static const CLOSE_BRACE:String = "}";
    private static const OPEN_BRACKET:String = "[";
    private static const CLOSE_BRACKET:String = "]";
    private static const ESCAPE_CHAR:String = "\\";
    private static const TAB:String = "\t";
    private static const NEW_LINE:String = "\n";
    private static const COMMA:String = ",";
    private static const ONLY_DIGITS:RegExp = new RegExp(/-*\d*\.*\d*/);
    private static const UNTIL_COMMA:RegExp = new RegExp(/^[^,]*/);
    
    public static function areEqual(arr1:Array, arr2:Array, sortCheck:Boolean = false):Boolean {
        
        if (arr1 == arr2) return true;
        
        if (arr1 == null || arr2 == null) return false;
        
        if (arr1.length != arr2.length) return false;
        
        var len:int = arr1.length;
        for (var i:int = 0; i < len; i++) {
            if(sortCheck && arr1[i] != arr2[i]){
                return false;
            }else if( arr2.indexOf(arr1[i]) < 0){
                return false;
            }
            
        }
        return true;
    }
    
    public static function patternOccurrences(pattern:String, target:String):uint
    {
        return target.match(new RegExp(pattern, "g")).length;
    }
    
    public static function formatJsonString(value:String, depth:int = 0):String {
        if(!value) return "";
        
        //DEBUG
//        var p1 = patternOccurrences(ESCAPE_CHAR+OPEN_BRACE, value);
//        var p2 = patternOccurrences(ESCAPE_CHAR+CLOSE_BRACE, value);
//        var p3 = patternOccurrences(ESCAPE_CHAR+OPEN_BRACKET, value);
//        var p4 = patternOccurrences(ESCAPE_CHAR+CLOSE_BRACKET, value);
//        trace(">f", depth, p1,p2,p3,p4,value);
//
//        if(p1 != p2 || p3 != p4){
//            trace("BUG>", value);
//        }
        
        var prefix:String = "";
        var middle:String = "";
        var suffix:String = "";
        var rest:String = "";
        
        while(value.charAt(0) == COMMA){
            value = value.substring(1);
        }
        
        var first:String = value.charAt(0);
        switch (first) {
            case OPEN_BRACE:
            case OPEN_BRACKET:
                var close:int = findClose(value);
                prefix = tabs(depth) + first + NEW_LINE;
                middle = formatJsonString(value.substring(1, close), depth+1);
                suffix = NEW_LINE + tabs(depth) + value.charAt(close);
                rest = NEW_LINE + formatJsonString(value.substring(close + 1), depth);
                break;
            default:
                if(fieldsOnly(value)){
                    var fields:Array = value.split(COMMA);
                    for each (var f:String in fields){
                        middle += tabs(depth) + f + COMMA + NEW_LINE;
                    }
                }else {
                    var firstAfterColonId:int = value.indexOf(":") + 1;
                    switch (value.charAt(firstAfterColonId)) {
                        case OPEN_BRACKET:
                        case OPEN_BRACE:
                            middle = NEW_LINE + tabs(depth) + value.substring(0, firstAfterColonId) + NEW_LINE + formatJsonString(value.substring(firstAfterColonId), depth);
                            break;
                        default:
                            var lastCharOfRow:int = firstAfterColonId + untilComma(value.substring(firstAfterColonId));
                            middle = tabs(depth) + value.substring(0, lastCharOfRow);
                            rest = NEW_LINE + formatJsonString(value.substring(lastCharOfRow), depth);
                            break;
                    }
                }
                break;
        }
        return prefix + middle + suffix + rest;
    }
    
    public static function untilComma(value:String):int {
        var row:String = UNTIL_COMMA.exec(value);
        return row.toString().length;
    }
    
    public static function fieldsOnly(value:String):Boolean {
        return value.indexOf(OPEN_BRACKET) < 0 && value.indexOf(OPEN_BRACE) < 0;
    }
    
    public static function findClose(value:String):int {
        var openSymbol:String = value.charAt(0);
        var closeSymbol:String;
        switch (openSymbol) {
            case OPEN_BRACE:
                closeSymbol = CLOSE_BRACE;
                break;
            case OPEN_BRACKET:
                closeSymbol = CLOSE_BRACKET;
                break;
        }
        
        var cursor:int = 1;
        var nextClose:int;
        var opens:int = 1;
        var closes:int = 0;
        
        while(cursor < value.length) {
            nextClose = value.indexOf(closeSymbol, cursor);
            closes++;
            
            opens += patternOccurrences(ESCAPE_CHAR+openSymbol, value.substring(cursor, nextClose));
            
            if(closes >= opens){
                return nextClose;
            }else {
                cursor = nextClose + 1;
            }
        }
        
        return -1;
    }
    
    public static function tabs(num:int = 1):String{
        var result:String = "";
        
        for (var i:int = 0; i<num;i++){
            result += TAB;
        }
        
        return result;
    }
}
}
