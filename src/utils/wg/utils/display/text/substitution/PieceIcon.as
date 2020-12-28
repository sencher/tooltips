package utils.wg.utils.display.text.substitution
{
	import wowp.account.model.AccountModel;
	import wowp.data.ivo.compound.EquipmentPieceData;
	import wowp.utils.display.cache.Cache;
	
	public dynamic class PieceIcon
	{
		private static var _ids:uint;
		public static const DEFAULT_SUBSTRING:String = "{piece}";
		static private const ICON_BASELINE_Y:Number = 15;
		
		public function PieceIcon(id:int)
		{
			var item:EquipmentPieceData = AccountModel.instance.equipmentPieces.getByID(id);
			this["image"] = Cache.getLoadedContent(item.imageSubstitutionPath);
			this["subString"] = item.imageSubstitutionSubstring;
			this["id"] = "pieces_" + uint(_ids++).toString();
			this["baseLineY"] = ICON_BASELINE_Y;
		}
	}
}
