package wowp.utils.display.text.substitution
{
	import flash.display.BitmapData;
	
	import wowp.utils.domain.getDefinition;
	
	public dynamic class BattleScoreSmallIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{battle_sc}";
		static private const ICON_BASELINE_Y:Number = 13;
		
		public function BattleScoreSmallIcon(substring:String = null)
		{
			this["image"] = new (getDefinition("iconBattleScoreSmall"))() as BitmapData;
			this["subString"] = substring == null ? DEFAULT_SUBSTRING : substring;
			this["id"] = "exp_free_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
	
}