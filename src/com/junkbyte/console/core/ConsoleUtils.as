package com.junkbyte.console.core {


public class ConsoleUtils {
    private static const OPEN_BRACE:String = "{";
    private static const CLOSE_BRACE:String = "}";
    private static const OPEN_BRACKET:String = "[";
    private static const CLOSE_BRACKET:String = "]";
    private static const COLON:String = ":";
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
            if (sortCheck && arr1[i] != arr2[i]) {
                return false;
            } else if (arr2.indexOf(arr1[i]) < 0) {
                return false;
            }
    
        }
        return true;
    }
    
    public static function patternOccurrences(pattern:String, target:String):uint {
        return target.match(new RegExp(pattern, "g")).length;
    }
    
    public static function formatJsonString(value:String, depth:int = 0):String {
//        Cc.red("formatJsonString", value, "depth:",depth);
        if (!value) return "";
        
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

//        while(value.charAt(0) == COMMA){
//            value = value.substring(1);
//        }
        
        var first:String = value.charAt(0);
        switch (first) {
            case OPEN_BRACE:
            case OPEN_BRACKET:
                var close:int = findClosePair(value);
                prefix = conditionalAdd(!depth, NEW_LINE) + tabs(depth) + first + NEW_LINE;
                middle = formatJsonString(value.substring(1, close), depth + 1);
                if (value.charAt(close + 1) == COMMA) {
                    suffix = NEW_LINE + tabs(depth) + value.charAt(close) + COMMA;
                    rest = NEW_LINE + formatJsonString(value.substring(close + 2), depth);
                } else {
                    suffix = conditionalAdd(middle, NEW_LINE) + tabs(depth) + value.charAt(close);
                    rest = /*NEW_LINE + */formatJsonString(value.substring(close + 1), depth);
                }
                break;
            default:
//                if(fieldsOnly(value)){
//                    var fields:Array = value.split(COMMA);
//                    for each (var f:String in fields){
//                        middle += tabs(depth) + f + COMMA + NEW_LINE;
//                    }
//                    middle = cutLastCommaAndNewLine(middle);
//                }else {
//                    var firstAfterColonId:int = value.indexOf(":") + 1;
//                    switch (value.charAt(firstAfterColonId)) {
//                        case OPEN_BRACKET:
//                        case OPEN_BRACE:
//                            middle = NEW_LINE + tabs(depth) + value.substring(0, firstAfterColonId) + NEW_LINE + formatJsonString(value.substring(firstAfterColonId), depth);
//                            break;
//                        default:
//                            var lastCharOfRow:int = firstAfterColonId + untilComma(value.substring(firstAfterColonId));
//                            middle = tabs(depth) + value.substring(0, lastCharOfRow);
//                            rest = NEW_LINE + formatJsonString(value.substring(lastCharOfRow), depth);
//                            break;
//                    }
//                }
        
                var firstOpen:int = findFirstOpen(value);
//                var lastClose:int = findLastClose(value);
                var closePair:int = findClosePair(value, firstOpen);
                if (firstOpen > -1) {
                    prefix = extractEqualValues(value.substring(0, firstOpen), depth) + NEW_LINE;
                    var nextCharAfterMiddleIsComma:Boolean = value.charAt(closePair + 1) == COMMA;
                    middle = formatJsonString(value.substring(firstOpen, closePair + 1), depth/* + 1*/) + conditionalAdd(nextCharAfterMiddleIsComma, COMMA + NEW_LINE);

//                    suffix = extractEqualValues(value.substring(closePair + int(nextCharAfterMiddleIsComma ? 2 : 1)), depth);
                    suffix = formatJsonString(value.substring(closePair + int(nextCharAfterMiddleIsComma ? 2 : 1)), depth);
                    //rest = /*NEW_LINE + */formatJsonString(value.substring(closePair + 1), depth);
                } else {
                    middle = extractEqualValues(value, depth, 1);
//                    var fields:Array = value.split(COMMA);
//                    for each (var f:String in fields){
//                        middle += tabs(depth) + f + COMMA + NEW_LINE;
//                    }
//                    middle = cutLastCommaAndNewLine(middle);
                }
        
                break;
        }

//        Cc.red("formatJsonString", value, "depth:",depth);
//        Cc.grass("prefix",prefix,"middle",middle,"suffix",suffix,"rest",rest)
        return prefix + middle + suffix + rest;
    }
    
    private static function extractEqualValues(value:String, depth:int, cutLastChars:int = 0):String {
        var result:String = "";
        var fields:Array = value.split(COMMA);
        var current:String;
        for (var i:int = 0; i < fields.length; i++) {
            current = fields[i];
            var lastCharIsColon:Boolean = current.charAt(current.length - 1) == COLON;
            if (current && current.length) {
                result += conditionalAdd(i /*|| lastCharIsColon*/, NEW_LINE) + tabs(depth) + current + conditionalAdd(!lastCharIsColon, COMMA);
            }
        }
        
        return cutLastChars ? result.substring(0, result.length - cutLastChars) : result;
    }
    
    private static function conditionalAdd(condition:*, symbol:String):String {
        if (condition) {
            return symbol;
        } else {
            return "";
        }
    }
    
    private static function cutLastNewLine(value:String):String {
        return value.substring(0, value.length - 1);
    }
    
    private static function cutLastCommaAndNewLine(value:String):String {
        return value.substring(0, value.length - 2);
    }
    
    public static function untilComma(value:String):int {
        var row:String = UNTIL_COMMA.exec(value);
        return row.toString().length;
    }
    
    public static function fieldsOnly(value:String):Boolean {
        return value.indexOf(OPEN_BRACKET) < 0 && value.indexOf(OPEN_BRACE) < 0;
    }
    
    private static function findFirstOpen(value:String):int {
        var firstBracket:int = value.indexOf(OPEN_BRACKET);
        var firstBrace:int = value.indexOf(OPEN_BRACE);
        
        if (firstBracket > -1) {
            if (firstBrace) {
                return Math.min(value.indexOf(OPEN_BRACKET), value.indexOf(OPEN_BRACE));
            } else {
                return firstBracket;
            }
        } else {
            if (firstBrace > -1) {
                return firstBrace;
            } else {
                return -1;
            }
        }
        //return Math.max(value.indexOf(OPEN_BRACKET), value.indexOf(OPEN_BRACE));
    }
    
    private static function findLastClose(value:String):int {
        return Math.max(value.lastIndexOf(CLOSE_BRACKET), value.lastIndexOf(CLOSE_BRACE));
    }
    
    public static function findClosePair(value:String, openCharId:int = 0):int {
        var openSymbol:String = value.charAt(openCharId);
        var closeSymbol:String;
        switch (openSymbol) {
            case OPEN_BRACE:
                closeSymbol = CLOSE_BRACE;
                break;
            case OPEN_BRACKET:
                closeSymbol = CLOSE_BRACKET;
                break;
        }
    
        var cursor:int = openCharId + 1;
        var nextClose:int;
        var opens:int = 1;
        var closes:int = 0;
    
        while (cursor < value.length) {
            nextClose = value.indexOf(closeSymbol, cursor);
            closes++;
        
            opens += patternOccurrences(ESCAPE_CHAR + openSymbol, value.substring(cursor, nextClose));
        
            if (closes >= opens) {
                return nextClose;
            } else {
                cursor = nextClose + 1;
            }
        }
        
        return -1;
    }
    
    public static function tabs(num:int = 1):String {
        var result:String = "";
        
        for (var i:int = 0; i < num; i++) {
            result += TAB;
        }
        
        return result;
    }
    
    private static const whoCalledTestStack:String = "Error\n" +
            "\tat com.junkbyte.console.core::ConsoleUtils$/whoCalledThis()[E:\\Projects\\tooltips\\src\\com\\junkbyte\\console\\core\\ConsoleUtils.as:238]\n" +
            "\tat com.junkbyte.console::Cc$/addToChannelWithStack()[E:\\Projects\\tooltips\\src\\com\\junkbyte\\console\\Cc.as:1397]\n" +
            "\tat com.junkbyte.console::Cc$/cyancw()[E:\\Projects\\tooltips\\src\\com\\junkbyte\\console\\Cc.as:394]\n" +
            "\tat Function/http://adobe.com/AS3/2006/builtin::apply()\n" +
            "\tat com.junkbyte.console::Ct$/cyancw()[E:\\Projects\\tooltips\\src\\com\\junkbyte\\console\\Ct.as:169]\n" +
            "\tat Test_Console/func2()[E:\\Projects\\tooltips\\src\\Test_Console.as:75]\n" +
            "\tat Test_Console777777777/func1()[E:\\Projects\\tooltips\\src\\Test_Console.as:67]\n" +
            "\tat Test_Console()[E:\\Projects\\tooltips\\src\\Test_Console.as:48]";
    
    public static function whoCalledThis(depth:int = 100, cutFirst:int = 1):String {
        var stack:String = new Error().getStackTrace();
        
//        stack = whoCalledTestStack;
        
        if (!stack) return "";
        
        var lines:Array = stack.split("\n");
        var result:String = "";
        var count:int = 0;
        
        for (var i:int = cutFirst; i < lines.length && count < depth; i++) {
            var line:String = lines[i];
            
            // Remove leading whitespace and "at "
            line = line.replace(/^\s*at\s+/, "");
            
            // Find method name (up to "()")
            var methodEnd:int = line.indexOf("()");
            if (methodEnd < 0) continue;
            var fullMethod:String = line.substring(0, methodEnd + 2); // include "()"
            
            // Remove package prefix (keep only after last "::")
            var sep:int = fullMethod.lastIndexOf("::");
            var methodWithClass:String = sep >= 0 ? fullMethod.substring(sep + 2) : fullMethod;
            
            // Split left class/method: class part before "/"
            var slash:int = methodWithClass.indexOf("/");
            var leftClass:String = slash >= 0 ? methodWithClass.substring(0, slash) : "";
            var method:String = slash >= 0 ? methodWithClass.substring(slash + 1) : methodWithClass;
            
            // Extract the part inside brackets [ ... ]
            var bracketStart:int = line.indexOf("[");
            var bracketEnd:int = line.indexOf("]");
            if (bracketStart < 0 || bracketEnd < 0) continue;
            
            var fileLine:String = line.substring(bracketStart + 1, bracketEnd);
            
            // Get actual class name (without path and .as)
            var lastSlash:int = Math.max(fileLine.lastIndexOf("\\"), fileLine.lastIndexOf("/"));
            var colon:int = fileLine.lastIndexOf(":");
            if (lastSlash < 0 || colon < 0) continue;
            
            var rightClass:String = fileLine.substring(lastSlash + 1, colon);
            if (rightClass.indexOf(".as") >= 0) rightClass = rightClass.replace(".as","");
            
            var lineNum:String = fileLine.substring(colon + 1);
            
            // Only remove trailing $ if leftClass = rightClass + "$"
            if (leftClass && leftClass.charAt(leftClass.length - 1) == "$" && leftClass.substr(0, leftClass.length - 1) == rightClass) {
                leftClass = rightClass;
            }
            
            // Constructor special case: leftClass/method = rightClass → show only "()"
            var methodNameOnly:String = method.replace("()", ""); // remove () for comparison
            if (methodNameOnly == rightClass) {
                method = "()";
                leftClass = "";
            }
            
            // Decide what to show on the left
            var leftPart:String = leftClass && leftClass != rightClass ? leftClass + "/" + method : method;
            
            result += leftPart + "  " + rightClass + ":" + lineNum + "\n";
            count++;
        }
        
        return result ? result + "*************" : "";
    }
    
    public static function traceStack(...rest):void {
        trace(rest, "\n", ConsoleUtils.whoCalledThis(100, 3));
    }
}
}
