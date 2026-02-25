package {
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.getTimer;

public class Dev_ConsoleWhoCalledThis extends Sprite {
    
    private static const TOTAL:int = 400000;   // calls per test
    private static const CHUNK:int = 5000;     // calls per frame
    
    private var i:int;
    private var t0:int;
    private var phase:int = 0;
    
    public function Dev_ConsoleWhoCalledThis() {
        trace("robust\n" + robustWhoCalled() + "\n-----\n");
        trace("verbose\n" + verboseWhoCalled() + "\n-----\n");
        trace("compact\n" + compactWhoCalled() + "\n-----\n");
        trace("compact_base\n" + compactWhoCalled_base() + "\n-----\n");
        trace("compact_index\n" + compactWhoCalled_index() + "\n-----\n");
        trace("compact_index2\n" + compactWhoCalled_index2() + "\n-----\n");
        trace("compact_replace\n" + compactWhoCalled_replace() + "\n-----\n");
        trace("compact_char\n" + compactWhoCalled_char() + "\n-----\n");
        trace("compact_char2\n" + compactWhoCalled_char2() + "\n-----\n");
        addEventListener(Event.ENTER_FRAME, step);
    }
    
    // =========================================================
    // FRAME BENCHMARK CONTROLLER
    // =========================================================
    private function step(e:Event):void {
        switch (phase) {
                
                // ---------- WARMUP ----------
            case 0:
                for (i = 0; i < 20000; i++) robustWhoCalled();
                trace("Warmup done");
                phase = 1; i = 0;
                break;
                
                // ---------- VERBOSE ----------
            case 1:
                if (i == 0) t0 = getTimer();
                runChunk(verboseWhoCalled);
                if (i >= TOTAL){
                    trace("Verbose:", getTimer() - t0, "ms");
                    phase = 2; i = 0;
                }
                break;
                
                // ---------- ROBUST ----------
            case 2:
                if (i == 0) t0 = getTimer();
                runChunk(robustWhoCalled);
                if (i >= TOTAL){
                    trace("Robust :", getTimer() - t0, "ms");
                    phase = 3; i = 0;
                }
                break;
                
                // ---------- COMPACT BASE ----------
            case 3:
                if (i == 0) t0 = getTimer();
                runChunk(compactWhoCalled_base);
                if (i >= TOTAL){
                    trace("Compact_base:", getTimer() - t0, "ms");
                    phase = 4; i = 0;
                }
                break;
                
                // ---------- COMPACT REPLACE ----------
            case 4:
                if (i == 0) t0 = getTimer();
                runChunk(compactWhoCalled_replace);
                if (i >= TOTAL){
                    trace("Compact_replace:", getTimer() - t0, "ms");
                    phase = 5; i = 0;
                }
                break;
                
                // ---------- COMPACT INDEX ----------
            case 5:
                if (i == 0) t0 = getTimer();
                runChunk(compactWhoCalled_index);
                if (i >= TOTAL){
                    trace("Compact_index:", getTimer() - t0, "ms");
                    phase = 6; i = 0;
                }
                break;
                
                // ---------- COMPACT INDEX ----------
            case 6:
                if (i == 0) t0 = getTimer();
                runChunk(compactWhoCalled_index2);
                if (i >= TOTAL){
                    trace("Compact_index2:", getTimer() - t0, "ms");
                    phase = 7; i = 0;
                }
                break;
                
                // ---------- COMPACT CHAR ----------
            case 7:
                if (i == 0) t0 = getTimer();
                runChunk(compactWhoCalled_char);
                if (i >= TOTAL){
                    trace("Compact_char:", getTimer() - t0, "ms");
                    phase = 8; i = 0;
                }
                break;
                
                // ---------- COMPACT CHAR ----------
            case 8:
                if (i == 0) t0 = getTimer();
                runChunk(compactWhoCalled_char2);
                if (i >= TOTAL){
                    trace("Compact_char2:", getTimer() - t0, "ms");
                    phase = 9; i = 0;
                }
                break;
            case 9:
                removeEventListener(Event.ENTER_FRAME, step);
                trace("Done");
                break;
        }
        
//        phase++; i = 0;
    }
    
    private function runChunk(fn:Function):void {
        var end:int = i + CHUNK;
        while (i < end && i < TOTAL) {
            fn();
            i++;
        }
    }
    
    
    // =========================================================
    // TEST STACK
    // =========================================================
    
    private static const whoCalledTestStack:String =
            "Error\n" +
            "\tat com.junkbyte.console.core::ConsoleUtils$/whoCalledThis()[E:\\p\\ConsoleUtils.as:238]\n" +
            "\tat com.junkbyte.console::Cc$/addToChannelWithStack()[E:\\p\\Cc.as:1397]\n" +
            "\tat com.junkbyte.console::Cc$/cyancw()[E:\\p\\Cc.as:394]\n" +
            "\tat com.junkbyte.console::Ct$/cyancw()[E:\\p\\Ct.as:169]\n" +
            "\tat Test_Console/func2()[E:\\p\\Test_Console.as:75]\n" +
            "\tat Test_Console777777777/func1()[E:\\p\\Test_Console.as:67]\n" +
            "\tat Test_Console()[E:\\p\\Test_Console.as:48]";
    
    
    // =========================================================
    // 1) VERBOSE (slowest)
    // =========================================================
    private function verboseWhoCalled(depth:int=100, cutFirst:int=1):String {
        var lines:Array = whoCalledTestStack.split("\n");
        var r:String="", c:int=0;
        
        for (var i:int=cutFirst;i<lines.length&&c<depth;i++){
            var line:String = lines[i].replace(/^\s*at\s+/, "");
            
            var me:int=line.indexOf("()");
            if(me<0) continue;
            
            var fm:String=line.substring(0,me+2);
            var sep:int=fm.lastIndexOf("::");
            var mwc:String=sep>=0?fm.substring(sep+2):fm;
            
            var slash:int=mwc.indexOf("/");
            var left:String=slash>=0?mwc.substring(0,slash):"";
            var meth:String=slash>=0?mwc.substring(slash+1):mwc;
            
            var b0:int=line.indexOf("["), b1:int=line.indexOf("]");
            if(b0<0||b1<0) continue;
            
            var fl:String=line.substring(b0+1,b1);
            var ls:int=Math.max(fl.lastIndexOf("\\"),fl.lastIndexOf("/"));
            var co:int=fl.lastIndexOf(":");
            if(ls<0||co<0) continue;
            
            var right:String=fl.substring(ls+1,co).replace(".as","");
            var ln:String=fl.substring(co+1);
            
            if(left&&left.charAt(left.length-1)=="$"&&left.substr(0,left.length-1)==right) left=right;
            if(meth.replace("()","")==right){meth="()";left="";}
            
            r+=(left&&left!=right?left+"/"+meth:meth)+"  "+right+":"+ln+"\n";
            c++;
        }
        return r;
    }
    
    
    // =========================================================
    // 2) ROBUST (recommended)
    // =========================================================
    private function robustWhoCalled(depth:int=100, cutFirst:int=1):String {
        var lines:Array=whoCalledTestStack.split("\n"), r:String="", c:int=0;
        
        for(var i:int=cutFirst;i<lines.length&&c<depth;i++){
            var l:String=lines[i].replace(/^\s*at\s*/,"");
            var b0:int=l.indexOf("["), b1:int=l.indexOf("]");
            if(b0<0||b1<0) continue;
            
            var fl:String=l.substring(b0+1,b1), ls:int=Math.max(fl.lastIndexOf("\\"),fl.lastIndexOf("/")), co:int=fl.lastIndexOf(":");
            if(ls<0||co<0) continue;
            
            var right:String=fl.substring(ls+1,co).replace(".as",""), ln:String=fl.substring(co+1);
            
            var me:int=l.indexOf("()"); if(me<0) continue;
            
            var sep:int=l.lastIndexOf("::",me), fm:String=l.substring(sep>=0?sep+2:0,me+2);
            
            var s:int=fm.indexOf("/"), left:String=s>=0?fm.substring(0,s):"", meth:String=s>=0?fm.substring(s+1):fm;
            
            if(left&&left.charAt(left.length-1)=="$"&&left.substr(0,left.length-1)==right) left=right;
            if(meth.replace("()","")==right){meth="()";left="";}
            
            r+=(left&&left!=right?left+"/"+meth:meth)+"  "+right+":"+ln+"\n";
            c++;
        }
        return r;
    }
    
    
    // =========================================================
    // 3) COMPACT (tiny faster, same logic)
    // =========================================================
    private function compactWhoCalled():String {
        var a:Array=whoCalledTestStack.split("\n"), r:String="";
        for(var i:int=1;i<a.length;i++){
            var l:String=a[i], me:int=l.indexOf("()"); if(me<0) continue;
            var b0:int=l.indexOf("["), b1:int=l.indexOf("]"); if(b0<0) continue;
            var fl:String=l.substring(b0+1,b1), co:int=fl.lastIndexOf(":");
            r+=l.substring(l.lastIndexOf("/",me)+1,me+2)+"  "+fl.substring(fl.lastIndexOf("\\")+1,co).replace(".as","")+":"+fl.substring(co+1)+"\n";
        }
        return r;
    }
    
    // =========================================================
// 3a) BASELINE (no "at" removal), constructor fix
// =========================================================
    private function compactWhoCalled_base():String {
        var a:Array=whoCalledTestStack.split("\n"), r:String="";
        for(var i:int=1;i<a.length;i++){
            var l:String=a[i], me:int=l.indexOf("()"); if(me<0) continue;
            var b0:int=l.indexOf("["), b1:int=l.indexOf("]"); if(b0<0) continue;
            var fl:String=l.substring(b0+1,b1), co:int=fl.lastIndexOf(":");
            var cls:String=fl.substring(fl.lastIndexOf("\\")+1,co).replace(".as","");
            
            var slash:int=l.lastIndexOf("/",me);
            var left:String;
            if(slash>=0){
                left=l.substring(slash+1,me+2);
            } else {
                // constructor logic
                var name:String=l.substring(0,me);
                left=(name==cls) ? "()" : name+"()";
            }
            
            r+=left+"  "+cls+":"+fl.substring(co+1)+"\n";
        }
        return r;
    }

// =========================================================
// 3b) REPLACE (slower, full string scan), constructor fix, replace all 'at' variants
// =========================================================
    private function compactWhoCalled_replace():String {
        var a:Array = whoCalledTestStack.split("\n"), r:String = "";
        for(var i:int = 1; i < a.length; i++){
            var l:String = a[i];
            
            // remove leading 'at ' or '\tat ' or multiple spaces
            l = l.replace(/^\s*at\s+/, "");
            
            var me:int = l.indexOf("()");
            if(me < 0) continue;
            
            var b0:int = l.indexOf("["), b1:int = l.indexOf("]");
            if(b0 < 0 || b1 < 0) continue;
            
            var fl:String = l.substring(b0 + 1, b1),
                    co:int = fl.lastIndexOf(":"),
                    cls:String = fl.substring(fl.lastIndexOf("\\") + 1, co).replace(".as", "");
            
            var slash:int = l.lastIndexOf("/", me);
            var left:String;
            if(slash >= 0){
                // normal Class/method
                left = l.substring(slash + 1, me + 2);
            } else {
                // constructor logic: if method name = class name → "()"
                var name:String = l.substring(0, me);
                left = (name == cls) ? "()" : name + "()";
            }
            
            r += left + "  " + cls + ":" + fl.substring(co + 1) + "\n";
        }
        return r;
    }

// =========================================================
// 3c) INDEXOF (fastest, prefix only), constructor fix
// =========================================================
    private function compactWhoCalled_index():String {
        var a:Array=whoCalledTestStack.split("\n"), r:String="";
        for(var i:int=1;i<a.length;i++){
            var l:String=a[i];
            var p:int=l.indexOf("at ");
            if(p>=0) l=l.substr(p+3);
            
            var me:int=l.indexOf("()"); if(me<0) continue;
            var b0:int=l.indexOf("["), b1:int=l.indexOf("]"); if(b0<0) continue;
            var fl:String=l.substring(b0+1,b1), co:int=fl.lastIndexOf(":");
            var cls:String=fl.substring(fl.lastIndexOf("\\")+1,co).replace(".as","");
            
            var slash:int=l.lastIndexOf("/",me);
            var left:String;
            if(slash>=0){
                left=l.substring(slash+1,me+2);
            } else {
                var name:String=l.substring(0,me);
                left=(name==cls) ? "()" : name+"()";
            }
            
            r+=left+"  "+cls+":"+fl.substring(co+1)+"\n";
        }
        return r;
    }
    
// =========================================================
// 3c) INDEXOF (fastest, prefix only), constructor fix
// =========================================================
    private function compactWhoCalled_index2():String {
        var a:Array=whoCalledTestStack.split("\n"), r:String="";
        for(var i:int=1;i<a.length;i++){
            var l:String=a[i];
            /*var p:int=l.indexOf("at ");
            if(p>=0) */l=l.substr(4);
            
            var me:int=l.indexOf("()"); if(me<0) continue;
            var b0:int=l.indexOf("["), b1:int=l.indexOf("]"); if(b0<0) continue;
            var fl:String=l.substring(b0+1,b1), co:int=fl.lastIndexOf(":");
            var cls:String=fl.substring(fl.lastIndexOf("\\")+1,co).replace(".as","");
            
            var slash:int=l.lastIndexOf("/",me);
            var left:String;
            if(slash>=0){
                left=l.substring(slash+1,me+2);
            } else {
                var name:String=l.substring(0,me);
                left=(name==cls) ? "()" : name+"()";
            }
            
            r+=left+"  "+cls+":"+fl.substring(co+1)+"\n";
        }
        return r;
    }

// =========================================================
// 3d) CHARCODE (micro fastest, tab only, least safe), constructor fix
// =========================================================
    private function compactWhoCalled_char():String {
        var lines:Array = whoCalledTestStack.split("\n");
        var result:String = "";
        
        for (var i:int = 1; i < lines.length; i++) {
            var line:String = lines[i];
            
            // remove leading tab if present
            if (line.charCodeAt(0) == 9) line = line.substr(4); // "\tat "
            
            // find method parentheses
            var methodEnd:int = line.indexOf("()");
            if (methodEnd < 0) continue;
            
            // find file info in brackets [...]
            var bracketStart:int = line.indexOf("[");
            var bracketEnd:int = line.indexOf("]");
            if (bracketStart < 0 || bracketEnd < 0) continue;
            
            var fileLine:String = line.substring(bracketStart + 1, bracketEnd);
            var colonPos:int = fileLine.lastIndexOf(":");
            var className:String = fileLine.substring(fileLine.lastIndexOf("\\") + 1, colonPos).replace(".as","");
            var lineNumber:String = fileLine.substring(colonPos + 1);
            
            // determine left part (method or constructor)
            var slashPos:int = line.lastIndexOf("/", methodEnd);
            var leftPart:String;
            if (slashPos >= 0) {
                leftPart = line.substring(slashPos + 1, methodEnd + 2); // include "()"
            } else {
                var methodName:String = line.substring(0, methodEnd);
                leftPart = (methodName == className) ? "()" : methodName + "()"; // constructor fix
            }
            
            result += leftPart + "  " + className + ":" + lineNumber + "\n";
        }
        
        return result;
    }
// =========================================================
// 3e) CHARCODE (micro fastest, tab only, least safe), constructor fix
// =========================================================
    private function compactWhoCalled_char2():String {
        var lines:Array = whoCalledTestStack.split("\n");
        var result:String = "";
        
        for (var i:int = 1; i < lines.length; i++) {
            var line:String = lines[i];
            
            // remove leading tab if present
            /*if (line.charCodeAt(0) == 9) */line = line.substr(4); // "\tat "
            
            // find method parentheses
            var methodEnd:int = line.indexOf("()");
            if (methodEnd < 0) continue;
            
            // find file info in brackets [...]
            var bracketStart:int = line.indexOf("[");
            var bracketEnd:int = line.indexOf("]");
            if (bracketStart < 0 || bracketEnd < 0) continue;
            
            var fileLine:String = line.substring(bracketStart + 1, bracketEnd);
            var colonPos:int = fileLine.lastIndexOf(":");
            var className:String = fileLine.substring(fileLine.lastIndexOf("\\") + 1, colonPos).replace(".as","");
            var lineNumber:String = fileLine.substring(colonPos + 1);
            
            // determine left part (method or constructor)
            var slashPos:int = line.lastIndexOf("/", methodEnd);
            var leftPart:String;
            if (slashPos >= 0) {
                leftPart = line.substring(slashPos + 1, methodEnd + 2); // include "()"
            } else {
                var methodName:String = line.substring(0, methodEnd);
                leftPart = (methodName == className) ? "()" : methodName + "()"; // constructor fix
            }
            
            result += leftPart + "  " + className + ":" + lineNumber + "\n";
        }
        
        return result;
    }
}
}