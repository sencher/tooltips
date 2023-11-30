package {

import flash.display.Sprite;

public class Test_ConstructorInheritance extends Sprite {
    public function Test_ConstructorInheritance() {
        //both constructors are called
        new Second();
    }
}
}

class First{
    public function First() {
        trace("First constructor");
    }
}

class Second extends First{
    public function Second() {
        trace("Second constructor");
    }
}

