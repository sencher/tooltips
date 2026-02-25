package wowp.utils.display.text.substitution 
{
	import flash.display.BitmapData;

	import wowp.utils.domain.getDefinition;

	public dynamic class GoldSmallIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{gold_sm}";
		static private const ICON_BASELINE_Y:Number = 9;
		
		public function GoldSmallIcon(substring:String = null, yOffset:int=0)
		{
			this["image"] = new (getDefinition("iconComCurrencyGoldSmall"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "credits_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y + yOffset;
		}
	}

}