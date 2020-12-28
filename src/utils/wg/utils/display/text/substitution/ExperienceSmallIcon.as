package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class ExperienceSmallIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{exp_sm}";
		static private const ICON_BASELINE_Y:Number = 9;
		
		public function ExperienceSmallIcon(substring:String = null)
		{
			this["image"] = new (getDefinition("iconComCurrencyExpSmall"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
	
}