package {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Shape;
import flash.display.Sprite;

import utils.Utils;

public class Test_BitmapDataFill extends Sprite {
    
    [Embed(source="../art/Gradient.png")]
    private var gradientClass:Class;
    
    public function Test_BitmapDataFill() {
        var gradient:Bitmap = new gradientClass();
        var bd:BitmapData = gradient.bitmapData;
        var p = bd.getPixel((bd.width-1)*0.8, (bd.height-1)*0.8);
        addChild(gradient);
        var shape:Shape = Utils.createBox(0,0,stage.stageWidth, stage.stageHeight,0,p);
        addChildAt(shape, 0);
    }
}
}
