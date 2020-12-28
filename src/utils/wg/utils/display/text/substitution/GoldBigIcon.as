package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class GoldBigIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{gold_big}";
		static private const ICON_BASELINE_Y:Number = 24;
		
		public function GoldBigIcon(substring:String = null, yOffset:int=0)
		{
			this["image"] = new (getDefinition("bmpIconComGoldMedium"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "gold_b_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y + yOffset;
		}
	}
}
