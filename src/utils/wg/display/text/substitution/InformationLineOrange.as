package utils.wg.display.text.substitution
{
	import flash.display.BitmapData;

	import wowp.utils.domain.getDefinition;

	public dynamic class InformationLineOrange
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String="{info_orange}";
		static private const ICON_BASELINE_Y:Number = 13;
		
		public function InformationLineOrange(substring:String = null)
		{
			this["image"] = new (getDefinition("iconTextInformationLineOrange"))() as BitmapData;
			this["subString"] = substring == null?DEFAULT_SUBSTRING:substring;
			this["id"] = "info_line_orange_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}

}