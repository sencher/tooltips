package wowp.utils.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class GoldIconOff
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{gold_off}";
		static private const ICON_BASELINE_Y:Number = 12;
		
		public function GoldIconOff(substring:String = null)
		{
			this["image"] = new (getDefinition("bmpIconComGoldOff"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "gold_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
		
	}
	
}