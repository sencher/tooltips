package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class CouponIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{coupon}";
		static private const ICON_BASELINE_Y:Number = 15;
		
		public function CouponIcon(substring:String = null)
		{
			this["image"] = new (getDefinition("bmpIconCoupon"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "gold_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
	
}