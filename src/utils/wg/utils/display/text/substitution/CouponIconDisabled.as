package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class CouponIconDisabled
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{coupon_dis}";
		static private const ICON_BASELINE_Y:Number = 15;
		
		public function CouponIconDisabled(substring:String = null)
		{
			this["image"] = new (getDefinition("bmpIconCouponDisabled"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "coupon_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
}
