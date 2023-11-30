package {

import flash.display.Sprite;

public class Test_StringInteresting extends Sprite {
    public function Test_StringInteresting() {
        trace(isInterestingString("aaaaa"));
        trace(isInterestingString("bf109aaaaa"));
        trace(isInterestingString("aaasdaa"));
        trace(isInterestingString("asdaaaa"));
        trace(isInterestingString("aaaaabf109"));
        trace(isInterestingString("zzzzz"));
    }
    
    public function isInterestingString(value:String):Boolean{
        if(value){
            var interesting:Array = ["bf109","asd"];
            for each (var element:String in interesting){
                if(value.indexOf(element) > -1) return true;
            }
        }
        return false;
    }
}
}
