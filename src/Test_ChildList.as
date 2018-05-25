package {
import avmplus.getQualifiedClassName;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;
import flash.text.TextField;

import utils.DomainUtils;
import utils.Utils;

public class Test_ChildList extends Sprite {
    public function Test_ChildList() {
        var mc:MovieClip = new MovieClip();
        mc.name = "main";
        var tf:TextField = new TextField();
        tf.name = "tf";
        tf.text = "some text here";
        var s:Sprite = new Sprite();
        var shape:Shape = new Shape();

        mc.addChild(tf);
        mc.addChild(s);
        mc.addChild(shape);

        trace(Utils.childList(mc));
    }
}
}
