package {
import flash.display.Sprite;

public class Test_SwitchCaseComplicated extends Sprite {
    public function Test_SwitchCaseComplicated() {
        doStuff(1);
        doStuff(2);
        doStuff(3);
    }
    
    public function doStuff(value:int):void {
        trace("***********")
        switch (value){
            case 1:
                trace(1);
            case 2:
                trace(2);
                break;
            default:
                trace("default");
                break;
        }
    }
}
}
