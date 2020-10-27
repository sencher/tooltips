package {
import flash.display.Sprite;

public class Test_TypeDetection extends Sprite {
    public function Test_TypeDetection() {
        var s:String = "asd";
        var n:Number = 7;
        var o:Object = {zz:44};
        var a:Array = [3,6,8,11];
        
        detect(s);
        detect(n);
        detect(o);
        detect(a);
        
    }
    
    private function detect(value:*):void {
        if (value is String == false){
            trace(value + " is not String");
        }
    }
}
}
