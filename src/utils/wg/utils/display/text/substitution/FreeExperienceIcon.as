package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class FreeExperienceIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{exp_free}";
		static private const ICON_BASELINE_Y:Number = 10;
		
		public function FreeExperienceIcon(substring:String = null)
		{
			this["image"] = new (getDefinition("iconComCurrencyExpFree"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_free_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
	
}