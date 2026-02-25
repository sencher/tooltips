package wowp.utils.display
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
     * Обрезает обьект BitmapData и возвращает новый
	 */
	public function crop(bData:BitmapData, left:int=0, right:int=0, top:int=0, bottom:int=0):BitmapData
	{
		var newWidth:int = bData.width - left - right;
		var newHeight:int = bData.height - top - bottom;
		var cropArea:Rectangle = new Rectangle(left, top, newWidth, newHeight);
		var cropped:BitmapData = new BitmapData(newWidth, newHeight);
		cropped.copyPixels(bData, cropArea, new Point());
		return cropped;
	}
}
