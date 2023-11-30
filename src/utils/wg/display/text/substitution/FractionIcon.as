package utils.wg.display.text.substitution
{
	import wowp.account.model.AccountModel;
	import wowp.data.ivo.compound.FractionData;
	import wowp.utils.display.cache.Cache;
	
	public dynamic class FractionIcon
	{
		private static var _ids:uint;
		static private const ICON_BASELINE_Y:Number = 12;
		
		public function FractionIcon(id:int)
		{
			var f:FractionData = AccountModel.instance.equipmentsModel.fraction.getByID(id);
			this["image"] = Cache.getLoadedContent(f.icon20x12);
			this["subString"] = f.imageSubstitutionSubstring;
			this["id"] = "fraction_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
}
