package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class FreeExperienceIconDisabled
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{exp_free_dis}";
		static private const ICON_BASELINE_Y:Number = 10;
		
		public function FreeExperienceIconDisabled(substring:String = null)
		{
			this["image"] = new (getDefinition("iconComCurrencyExpFree_dis"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_free_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
	
}