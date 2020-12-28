package utils.wg.utils.display.text.substitution
{
	import wowp.account.model.AccountModel;
	import wowp.data.ivo.compound.NationData;
	import wowp.utils.display.cache.Cache;
	
	public dynamic class NationIcon
	{
		private static var _ids:uint;
		static private const ICON_BASELINE_Y:Number = 15;
		
		public function NationIcon(id:int)
		{
			var nd:NationData = AccountModel.instance.nationsModel.getNationDataByID(id);
			this["image"] = Cache.getLoadedContent(nd.flag_24x20);
			this["subString"] = nd.imageSubstitutionSubstring;
			this["id"] = "nation_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
}
