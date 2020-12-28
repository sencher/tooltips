package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;

	import wowp.utils.domain.getDefinition;

	public dynamic class XPFactorIcon 
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String="{xp_factor}"
		static private const ICON_BASELINE_Y:Number = 11;
		
		public function XPFactorIcon(substring:String = null) 
		{
			this["image"] = new (getDefinition("iconComExpDouble"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "xp_factor_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}

}