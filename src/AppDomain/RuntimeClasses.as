package AppDomain {
import flash.display.Sprite;

import utils.Utils;

public class RuntimeClasses extends Sprite
{
    public function RuntimeClasses()
    {
        trace(Utils.whoCalledThis());
        trace("RuntimeClasses Constructor");
    }

    public function greet():String {
        return("Hello World");
    }
}
}
