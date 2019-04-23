package {
import flash.display.Shape;

import flash.display.Sprite;
import flash.display.StageScaleMode;

[SWF(width=1920,height=1080)]
public class Test_StageScale extends Sprite {
//    [Embed(source="swf/Girl_bkg_January_05.swf", symbol="g1")]
//    public var g1:Class;

    public function Test_StageScale() {
        super();
        drawBox(0,0,1920,1080,0,0xffff00)
        stage.scaleMode = StageScaleMode.SHOW_ALL;
    }

    private function drawBox(x:Number, y:Number, w:Number, h:Number, angle:Number, color:uint):void
    {
        trace("drawBox",arguments)
        var box:Shape = new Shape();
        box.graphics.lineStyle(1, color, .75);
        box.graphics.beginFill(0xcccccc);
//        box.graphics.drawRect(-w/2,-h/2,w,h);
        box.graphics.drawRect(0,0,w,h);
        box.x = x;
        box.y = y;
        box.rotation = angle;

        stage.addChild(box);
    }
}
}
