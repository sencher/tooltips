package utils.wg.display {

import flash.display.Shape;

public function createShape(x:Number = 0, y:Number = 0, w:Number = 100, h:Number = 100, angle:Number = 0, color:uint = 0xcccccc, alpha:Number = 1, border:Boolean = true, borderColor:uint = 0x000000):Shape {
    var box:Shape = new Shape();
    if (border) box.graphics.lineStyle(1, borderColor, .75);
    box.graphics.beginFill(color);
    box.graphics.drawRect(0, 0, w, h);
    box.x = x;
    box.y = y;
    box.rotation = angle;
    box.alpha = alpha;
    
    return box;
}
}
