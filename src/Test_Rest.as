package {

import flash.display.Sprite;

public class Test_Rest extends Sprite{
    public function Test_Rest() {
//        first("bla");
//        first("oh", true);
//        first("zzz", 7,8);
        first("kkkaaa", 3, "a", true);
    }
    
    private function first(name:String, ...rest):void {
//        second.call(0, name, rest);
        second.apply(0, rest);
    }
    
    private function second(name:String, value1:int, value2:String = ""):void{
        trace(name, arguments);
    }
}
}
