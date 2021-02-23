package {
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;

public class Test_MovieClipClone extends Sprite {
    public function Test_MovieClipClone() {
        var a:* = new button_profile_personalmessage();
        a.txt_profile_personalmessage.text = "123456";
        a.x = a.y = 50;
        addChild(a);
        
        var b:* = copyClip(a);
        b.x = b.y = 150;
        addChild(b);
        b.txt_profile_personalmessage.text = "bbb";
    }
    
    public function copyClip( clip:DisplayObject ):DisplayObject
    {
        var sourceClass:Class = Object(clip).constructor;
        var duplicate:DisplayObject = new sourceClass();
        return duplicate;
    }
}
}
