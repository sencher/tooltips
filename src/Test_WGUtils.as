package {
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

import utils.wg.Utils;

import utils.wg.object.setPropByPath;

import utils.wg.string.reduceNumber;

import utils.wg.object.getPropByPath;

public class Test_WGUtils extends Sprite {
    public function Test_WGUtils() {
//        var format:TextFormat = new TextFormat();
//        format.size = 40;
//        var tf:TextField = new TextField();
//        tf.width = stage.stageWidth;
//        tf.defaultTextFormat = format;
//        addChild(tf);
//        tf.htmlText = reduceNumber(10000);
    
//        var a:Object = {b: 7};
//        setPropByPath(a, "s.d.k", "sdk")
//        trace(getPropByPath(a, "b"));
//        trace(getPropByPath(a, "zzz"));
//        trace(getPropByPath(a, "s.d.k"));
//        trace(JSON.stringify(a));
        
        var dest:Array = [1,2,8];
        var src:Array = [7,4,11,6];
        Utils.refillArray(dest, src);
        trace(dest);
    }
}
}
