package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;

	import wowp.utils.Utils;

	import wowp.utils.domain.getDefinition;

	public dynamic class CouponSmallIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{coupon_sm}";
		static private const ICON_BASELINE_Y:Number = 12;
		
		public function CouponSmallIcon(substring:String = null)
		{
			this["image"] = new (getDefinition("bmpComTicketsSmall"))() as BitmapData;
			this["subString"] = substring == null?Utils.trimWhitespace(DEFAULT_SUBSTRING):substring;
			this["id"] = "gold_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}

}