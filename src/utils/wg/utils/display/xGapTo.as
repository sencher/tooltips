package utils.wg.utils.display
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
		
	public function xGapTo(from:DisplayObject, to:DisplayObject):Number
	{
		if (from.parent == null || to.parent == null) return NaN;
		var b:Rectangle = from.getBounds(from.parent);
		var c:Rectangle = to.getBounds(to.parent);
		return c.left - b.right;
	}
}