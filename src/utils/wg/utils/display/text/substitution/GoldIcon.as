package utils.wg.utils.display.text.substitution
{
	import flash.display.BitmapData;

	import wowp.utils.domain.getDefinition;

	public dynamic class GoldIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{gold}";
		static private const ICON_BASELINE_Y:Number = 11;
		
		public function GoldIcon(substring:String = null, yOffset:int=0)
		{
			this["image"] = new (getDefinition("bmpIconGold"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "gold_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y + yOffset;
		}
	}

}