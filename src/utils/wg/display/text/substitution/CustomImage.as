package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;
	
	
	public dynamic class CustomImage 
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{image}";
		
		public function CustomImage(image:BitmapData, substring:String = null, baseLine:Number = 17)
		{
			this["image"] = image;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "image_" + uint(_ids++).toString();
			this["baseLineY"] = baseLine;
		}
		
	}

}