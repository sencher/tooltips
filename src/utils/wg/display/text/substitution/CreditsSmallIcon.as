package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;

	import wowp.utils.domain.getDefinition;

	public dynamic class CreditsSmallIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{cred_sm}";
		static private const ICON_BASELINE_Y:Number = 9;
		
		public function CreditsSmallIcon(substring:String = null, yOffset:int=0)
		{
			this["image"] = new (getDefinition("iconComCurrencyCreditsSmall"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "credits_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y + yOffset;
		}
	}

}