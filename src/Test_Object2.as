package {
import flash.display.Sprite;

public class Test_Object2 extends Sprite {
    public function Test_Object2() {
        var o:Object = {"background":"","descriptionLoc":"","frame":"","icon":"","rewards":{"plane":[10691,"",false]},"titleLoc":"","titleTextColor":1};
        trace(o.titleTextColor);
        trace(o.rewards.plane);
    }
}
}
