package {

import dummy.Dummy;
import dummy.DummyFabric;

import flash.display.Sprite;

public class Test_ToString extends Sprite {
    public function Test_ToString() {
        var d:Dummy = DummyFabric.insnatce.getDummy();
        var d2:Dummy = DummyFabric.insnatce.getDummy();
        trace(d, Dummy(d).toString());
    }
}
}
