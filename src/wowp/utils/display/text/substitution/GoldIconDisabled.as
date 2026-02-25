package wowp.utils.display.text.substitution
{
	import flash.display.BitmapData;

	import wowp.utils.domain.getDefinition;

	public dynamic class GoldIconDisabled 
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{gold_dis}";
		static private const ICON_BASELINE_Y:Number = 11;
		
		public function GoldIconDisabled(substring:String = null)
		{
			this["image"] = new (getDefinition("bmpIconGoldDisabled"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "gold_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}

}
