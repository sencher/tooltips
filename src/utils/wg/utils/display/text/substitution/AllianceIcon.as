package utils.wg.utils.display.text.substitution
{
	import wowp.account.model.AccountModel;
	import wowp.data.ivo.compound.AllianceData;
	import wowp.utils.display.cache.Cache;
	
	public dynamic class AllianceIcon
	{
		private static var _ids:uint;
		static private const ICON_BASELINE_Y:Number = 15;
		
		public function AllianceIcon(id:int)
		{
			var ad:AllianceData = AccountModel.instance.nationsModel.getAllianceDataByID(id);
			this["image"] = Cache.getLoadedContent(ad.flag_24x20);
			this["subString"] = ad.imageSubstitutionSubstring;
			this["id"] = "alliance_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
}
