package wowp.utils.display 
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
		
	public function bottom(obj:DisplayObject):Number
	{
		return obj.y + obj.height;
	}
}