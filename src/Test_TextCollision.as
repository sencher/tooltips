package {

import flash.display.Sprite;
import flash.text.TextField;

public class Test_TextCollision extends Sprite {
    private var tf1:TextField = new TextField();
    private var tf2:TextField = new TextField();
    
    public function Test_TextCollision() {
        tf2.x = 50;
        
        addChild(tf1);
        addChild(tf2);
    }
}
}
