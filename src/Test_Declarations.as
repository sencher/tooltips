package {

import flash.display.Sprite;

[SWF(width="800", height="800")]
public class Test_Declarations extends BaseTest {
    private const SELECTED:String = "selected_";
    protected var statesSelected:Vector.<String> = Vector.<String>([SELECTED, ""]);
    
    public function Test_Declarations() {
        log(5);
        overRide("asdfsf");
        log(statesSelected);
        func();
    }
    
    private function func(value:String = SELECTED):void {
        log(value);
    }
}
}
