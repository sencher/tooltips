package utils.wg.utils
{
	import flash.display.MovieClip;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import scaleform.clik.utils.Padding;

	import wowp.utils.domain.getDefinition;

	public class MovieClipTiled extends MovieClip
	{
		private var _textureName:String;
		
        [Inspectable(defaultValue="")]
        public function set textureName(value:String):void { _textureName = value; }
        public function get textureName():String { return _textureName; }
		
		public var tilePadding:Padding;
		
		public function MovieClipTiled()
		{
			super();
			tilePadding = new Padding(0);
		}
		
		public function draw(width:int, height:int, left:int = 0, top:int = 0, right:int = 0, bottom:int = 0, rounded:int = 0):void
		{
			tilePadding.left = left;
			tilePadding.top = top;
			tilePadding.right = right;
			tilePadding.bottom = bottom;
			
			var texture:Class = getDefinition(_textureName, loaderInfo);
			var bitmap:BitmapData = new texture();
			var matrix:Matrix = new Matrix();
		
			graphics.clear();
			
			graphics.beginBitmapFill(bitmap, matrix, true);
			
			if (rounded == 0)
			{
				graphics.drawRect(tilePadding.left, tilePadding.top, width - tilePadding.left - tilePadding.right, height - tilePadding.top - tilePadding.bottom);
			}
			else
			{
				graphics.drawRoundRect(tilePadding.left, tilePadding.top, width - tilePadding.left - tilePadding.right, height - tilePadding.top - tilePadding.bottom, rounded, rounded);
				//graphics.drawRoundRect(100, 100, 300, 190, 20, 20);
			}
			graphics.endFill();
		}
	}
}
