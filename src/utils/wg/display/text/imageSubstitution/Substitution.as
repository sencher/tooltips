package utils.wg.display.text.imageSubstitution
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	
	public class Substitution 
	{
		public static var bitmapPixelSnapping:String = "auto";
		public static var bitmapSmoothing:Boolean = false;
		
		protected var _pattern:String;
		protected var _image:Object;		
		
		public function Substitution(pattern:String, image:Object)
		{
			_pattern = pattern;
			_image = image;
		}
		
		public function get pattern():String
		{
			return _pattern;
		}
		
		public function get image():DisplayObject
		{
			if (_image is DisplayObject)
			{
				return DisplayObject(new _image["constructor"]());
			}
			
			if (_image is BitmapData)
			{
				return new Bitmap(BitmapData(_image), bitmapPixelSnapping, bitmapSmoothing);
			}
			
			return null;
		}
		
	}

}