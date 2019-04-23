package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;

import utils.Utils;

public class Test_Utils_log extends Sprite {
    public function Test_Utils_log() {
        super();
        Cc.start(this);
        Cc.visible = true;
        someFunc("aaa",2,[{a:1},{b:7}])
        someFunc([{a:1,zz:"cool"},{b:17}])
    }

    private function someFunc(...args):void {
        Utils.logFuncNameAndArgs(args);
    }
}
}
