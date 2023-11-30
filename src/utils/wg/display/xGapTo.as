package utils.wg.display {

import flash.display.DisplayObject;
import flash.geom.Rectangle;

public function xGapTo(from:DisplayObject, to:DisplayObject):Number {
    //Cc.logc(this, "xGapTo", from, to);
    if (from.parent == null || to.parent == null) return NaN;
    var fromRect:Rectangle = from.getBounds(from.parent);
    var toRect:Rectangle = to.getBounds(to.parent);
    //Cc.logc(this, "xGapTo", fromRect, toRect, toRect.left, -fromRect.right);
    return toRect.left - fromRect.right;
}
}