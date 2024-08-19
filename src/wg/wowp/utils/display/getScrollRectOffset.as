package wowp.utils.display 
{
	import flash.geom.Point;
	import flash.display.DisplayObject;
	
	public function getScrollRectOffset(dObj:DisplayObject):Point
	{
		var offset:Point = new Point();
		while(dObj.parent != null)
		{
			dObj = dObj.parent;
			if(dObj.scrollRect != null)
			{
				offset.x += dObj.scrollRect.x;
				offset.y += dObj.scrollRect.y;
			}
		}
		return offset;
	}

}