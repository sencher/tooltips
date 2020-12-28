package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class ExperienceIconDisabled
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{exp_dis}";
		static private const ICON_BASELINE_Y:Number = 10;
		
		public function ExperienceIconDisabled(substring:String = null)
		{
			this["image"] = new (getDefinition("bmpIconExpDisabled"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
}
