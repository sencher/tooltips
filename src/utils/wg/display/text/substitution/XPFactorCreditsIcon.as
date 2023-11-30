package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;

	import wowp.utils.domain.getDefinition;

	public dynamic class XPFactorCreditsIcon 
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String="{exp_credits}";
		static private const ICON_BASELINE_Y:Number = 11;
		
		public function XPFactorCreditsIcon(substring:String = null) 
		{
			this["image"] = new (getDefinition("iconComExpCreditsDouble"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "xp_factor_credits_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}

}