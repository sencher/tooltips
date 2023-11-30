package utils.wg.display
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
		
	public function yGapTo(from:DisplayObject, to:DisplayObject):Number
	{
		if (from.parent == null || to.parent == null) return NaN;
		var b:Rectangle = from.getBounds(from.parent);
		var c:Rectangle = to.getBounds(to.parent);
		return c.top - b.bottom;
	}
}