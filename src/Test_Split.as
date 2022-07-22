package {

import flash.display.Sprite;

public class Test_Split extends Sprite{
    public function Test_Split() {
        var s1:String = "aaa";
        var s2:String = "aaa#bbb";
        var s3:String = "aaa#bbb#ccc";
        var s4:String = "aaa#bbb#";
        
        trace(splitString(s1));
        trace(splitString(s2));
        trace(splitString(s3));
        trace(splitString(s4));
        
        trace(spl2(s1));
        trace(spl2(s2));
        trace(spl2(s3));
        trace(spl2(s4));
    }
    
    private function splitString(value:String):String {
        var array:Array = value.split("#");
        return array[array.length-1];
    }
    
    private function spl2(value:String):String {
        return value.substring(value.lastIndexOf("#") + 1);
    }
}
}
