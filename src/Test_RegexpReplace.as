package {
	import com.junkbyte.console.Cc;
	
	import flash.display.Sprite;

public class Test_RegexpReplace extends Sprite {
    public function Test_RegexpReplace() {
	    Cc.start(this);
	    Cc.config.commandLineAllowed = true;
	    Cc.config.commandLineAutoScope = true;
	    
	    var a:String = "     aaa     bbb    ccc ddd   ";
	    trace(a);
	    Cc.logch("a", a, "/");
	    
//	    var b:String = a.replace(/\s*(.*)/, "$1");
//	    trace(b);
//	    Cc.logch("b", b);
//
//	    var c:String = a.replace(/\s*/, "");
//	    trace(c);
//	    Cc.logch("c", c);
//
//	    var d:String = a.replace(/ +/, "");
//	    trace(d);
//	    Cc.logch("d", d);
//
//	    var e:String = a.replace(" ", "");
//	    trace(e);
//	    Cc.logch("e", e);
	
	    Cc.logch("6",a.search("aaa"), "/");
	    Cc.logch("7",a.search(/aaa/), "/");
	    Cc.logch("8",a.replace("aaa","a"), "/");
	    Cc.logch("9",a.replace(/aaa/,"a"), "/");
	    Cc.logch("10", trim(a), "/");
	    
    }
	
	function trim(str:String):String{
		var counter:int = 0;
		var counterEnd:int = str.length - 1;
		while(str.charAt(counter) == " "){
			counter++;
		}
		while(str.charAt(counterEnd) == " "){
			counterEnd--;
		}
		return str.substring(counter, counterEnd + 1);
	}
	
}
}
