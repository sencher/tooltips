package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class CouponSmallIconDisabled
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{coupon_dis_s}";
		static private const ICON_BASELINE_Y:Number = 12;
		
		public function CouponSmallIconDisabled(substring:String = null)
		{
			this["image"] = new (getDefinition("bmpComTicketsSmallDisabled"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "coupon_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
}
