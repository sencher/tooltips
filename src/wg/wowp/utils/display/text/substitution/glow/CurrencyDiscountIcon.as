package wowp.utils.display.text.substitution.glow
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class CurrencyDiscountIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{discount.g}";
		static private const RECT:Rectangle = new Rectangle(53, 12, 20, 15);
		
		public function CurrencyDiscountIcon(substring:String = null)
		{
			this["image"] = new (getDefinition("iconComCurrencyDiscount"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_" + uint(_ids++).toString();
			this["baseLineX"] = RECT.x;
			this["baseLineY"] = RECT.bottom;
			this["boundsWidth"] = RECT.width;
			this["boundsHeight"] = RECT.height;
		}
	}
	
}