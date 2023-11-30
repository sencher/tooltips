package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class EliteExperienceSmallIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{elite_sm}";
		static private const ICON_BASELINE_Y:Number = 9;
		
		public function EliteExperienceSmallIcon(substring:String = null)
		{
			this["image"] = new (getDefinition("iconComCurrencyExpEliteSmall"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
	
}