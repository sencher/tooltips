package AppDomainConflict.es {
import flash.display.Sprite;
import flash.text.TextField;

public class Greeter extends Sprite
{
    public function Greeter()
    {
        var tf:TextField = new TextField();
        tf.text = greet();
        addChild(tf);
    }

    public function greet():String {
        return("Buenos Dias");
    }
}
}