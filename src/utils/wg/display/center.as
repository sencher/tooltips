package utils.wg.display
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
		
	public function center(obj:DisplayObject):Point
	{
		return new Point(obj.x + obj.width / 2, obj.y + obj.height / 2);
	}
}