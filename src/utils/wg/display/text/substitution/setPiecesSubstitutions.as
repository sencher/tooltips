package utils.wg.display.text.substitution
{
	import flash.text.TextField;
	
	import scaleform.gfx.TextFieldEx;
	
	import wowp.account.model.AccountModel;
	import wowp.account.model.equipments.EquipmentPieceCollection;
	import wowp.data.ivo.compound.EquipmentPieceData;
	
	public function setPiecesSubstitutions(textfield:TextField):void {
		if (!textfield) return;
		var epc:EquipmentPieceCollection = AccountModel.instance.equipmentPieces;
		if (!epc.isValid) {
			// should of waited for it
			return;
		}
		var ids:Array = epc.allIds;
		var len:int = ids.length;
		for (var i:int = 0; i < len; i++) {
			var item:EquipmentPieceData = epc.getByID(ids[i]);
			if (item) {
				TextFieldEx.setImageSubstitutions(textfield, new PieceIconDisabled(item.id));
				TextFieldEx.setImageSubstitutions(textfield, new PieceIcon(item.id));
			}
		}
	}
}
