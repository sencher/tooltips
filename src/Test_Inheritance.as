package {

import flash.display.Sprite;

public class Test_Inheritance extends Sprite {
    public function Test_Inheritance() {
        var f:* = new first();
        var s:* = new second();
        f.doStuff();
        s.doStuff();
    }
}
}

import flash.utils.getQualifiedClassName;

import utils.wg.domain.getClassName;

class first{
    public function doStuff():void{
        trace(1, toString());
    }
    
    public function toString():String {
        return getClassName(this) + "/" + getQualifiedClassName(this) + " first";
    }
}

class second extends first{
    
    override public function doStuff():void {
        super.doStuff();
        trace(2, toString())
    }
    
//    override public function toString():String {
//        return "second";
//    }
}
