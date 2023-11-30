package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class FreeExperienceIconOff
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{exp_off}";
		static private const ICON_BASELINE_Y:Number = 12;
		
		public function FreeExperienceIconOff(substring:String = null)
		{
			this["image"] = new (getDefinition("iconComExpOff"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_off_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
		
	}
	
}