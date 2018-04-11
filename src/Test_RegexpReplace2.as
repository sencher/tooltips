package {

	import flash.display.Sprite;

public class Test_RegexpReplace2 extends Sprite {
    private var reg:RegExp;
    public function Test_RegexpReplace2() {
		/*
		* $ Code	Replacement Text

		$$	$
		$&	The matched substring.

		$`	The portion of the string that precedes the matched substring. Note that this code uses the straight left single quote character (`),
		not the straight single quote character (') or the left curly single quote character (‘).

		$'	The portion of string that follows the matched substring. Note that this code uses the straight single quote character (').

		$n	The nth captured parenthetical group match, where n is a single digit 1-9 and $n is not followed by a decimal digit.

		$nn	The nnth captured parenthetical group match, where nn is a two-digit decimal number (01-99). If the nnth capture is undefined,
		the replacement text is an empty string.

		*/
        var str:String = "flip-flop";
        var pattern:RegExp = /(\w+)-(\w+)/g;
        trace(str.replace(pattern, "$2-$1")); // flop-flip


        var str1:String = "abc12 def34";
        var pattern:RegExp = /([a-z]+)([0-9]+)/;
        var str2:String = str1.replace(pattern, replFN);
        trace (str2);   // 12abc 34def

        function replFN():String {
            return arguments[2] + arguments[1];
        }


		var s1:String = "aaa/bbb/aaa";
		var s2:String = "nnn/mmm";
		var s3:String = "zzz";

//		var reg:RegExp = /.*\//g;
		reg = /(.*)\//;
//		var reg:RegExp = new RegExp(/(aaa)/);

		var new1a:String = s1.replace(reg, "$$");
		var new1b:String = s1.replace(reg, "$&");
		var new1c:String = s1.replace(reg, "$`");
		var new1d:String = s1.replace(reg, "$'");
		var new1e:String = s1.replace(reg, "$1");
		var new1f:String = s1.replace(reg, "$2");
		var new1g:String = s1.replace(reg, "$3");

		var new12 = reg.exec(s1);
		var new22 = reg.exec(s2);
		var new32 = reg.exec(s3);
		trace(new12, new22, new32);
        trace(extractByPattern(s1));
        trace(extractByPattern(s2));
        trace(extractByPattern(s3));
    }

    private function extractByPattern(s:String):String {
        var arr:Array = reg.exec(s);
        if(arr){
           return arr[arr.length -1];
        }
        return null;
    }

}
}
