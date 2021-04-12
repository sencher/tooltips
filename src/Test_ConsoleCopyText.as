package {
import com.junkbyte.console.Cc;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldType;

public class Test_ConsoleCopyText extends Sprite {
    
    private var textField:TextField = new TextField();
    
    public function Test_ConsoleCopyText() {
        var sW:Number = stage.stageWidth;
        var sH:Number = stage.stageHeight;
        textField.type = TextFieldType.INPUT;
        textField.y = sH/2;
        textField.text = "1232412";
        addChild(textField);
        
        Cc.start(this);
        Cc.width = textField.width = sW;
        Cc.height = textField.height = sH/2;
        Cc.commandLine = true;
        
        
    }
}
}
