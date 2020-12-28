package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;

	import wowp.utils.domain.getDefinition;

	public dynamic class CreditsIconDisabled 
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{credits_dis}";
		static private const ICON_BASELINE_Y:Number = 11;
		
		public function CreditsIconDisabled(substring:String = null) 
		{
			this["image"] = new (getDefinition("bmpIconCreditsDisabled"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "credits_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}

}