package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class MasteryScoreSmallIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{mastery_sc}";
		static private const ICON_BASELINE_Y:Number = 12;
		
		public function MasteryScoreSmallIcon(substring:String = null)
		{
			this["image"] = new (getDefinition("iconMasteryScoreSmall"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_free_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
	
}