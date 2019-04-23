package {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;

public class Test_Focus extends Sprite {
    public function Test_Focus() {
        var tf:TextField = new TextField();
        tf.text = "okdsfhio2h34h4hj4hjl2k43";
        tf.width = 500;
        tf.border = true;
        addChild(tf);

        var tf2:TextField = new TextField();
        tf2.type = TextFieldType.INPUT;
        tf2.text = "okdsfhio2h34h4hj4hjl2k43";
        tf2.border = true;
        tf2.width = 500;
        tf2.y = 200;
        addChild(tf2);


        stage.addEventListener(MouseEvent.CLICK, onClick)
    }

    private function onClick(event:MouseEvent):void {
        trace(stage.focus);
        if(stage.focus) {
            trace(stage.focus.parent, Object(stage.focus).type);
        }
    }
}
}
