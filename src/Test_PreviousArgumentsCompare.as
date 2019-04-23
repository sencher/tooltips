package {
import flash.display.Sprite;

import utils.Utils;

public class Test_PreviousArgumentsCompare extends Sprite {

    //Cause Array passed as copy to function
    private var _prevArgsObject:Object = {};

    public function Test_PreviousArgumentsCompare() {
        func(1,5,7);
        func(1,5,7);
        func(3,3,9);
        func("a");
        func("a");
        func(1,5);
        func(1,5);
        func();
        func();
    }

    private function func(i:* = "", i2:* = "", i3:* = ""):void {
        if(Utils.sameAsPreviousArgs(arguments, _prevArgsObject)){
            trace("ignored", arguments);
            return;
        }

        trace("completed", arguments);
    }

}
}
