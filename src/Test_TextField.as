package {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldType;

public class Test_TextField extends Sprite {
    private var tf:TextField = new TextField();
    public function Test_TextField() {
        tf.multiline = true;
        tf.wordWrap = true;
//        tf.text
        tf.type = TextFieldType.INPUT;
        tf.border = true;
        addChild(tf);
    }
}
}
