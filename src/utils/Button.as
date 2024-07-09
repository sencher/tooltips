package utils {

import flash.display.Shape;
import flash.display.Sprite;
import flash.text.TextField;

public class Button extends Sprite {
    private var textField:TextField = new TextField();
    public function Button(text:String) {
        var box:Shape = Utils.createBox();
        addChild(box);
        textField.width = box.width;
        textField.height = box.height;
        textField.text = text;
        textField.selectable = false;
        addChild(textField);
    }
}
}
