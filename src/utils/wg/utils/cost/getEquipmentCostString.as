package utils.wg.utils.cost
{
	import wowp.account.constants.ColorConstants;
	import wowp.account.model.AccountModel;
	import wowp.data.ivo.compound.EquipmentPieceData;
	import wowp.hangar.popups.fitting.vo.EquipmentCostVO;
	import wowp.utils.string.paint;
	import wowp.utils.string.stringAddSeparator;
	
	public function getEquipmentCostString(cost:EquipmentCostVO, isEnabled:Boolean = true,
                                           checkResources:Boolean = false, separator:String = " ",
                                           addIcon:Boolean = true):String {
		
		var pieceIDs:Array = cost.pieceIDs.slice();
		var len:int = pieceIDs.length;
		
		var costArr:Array = [getCostString(cost, isEnabled, checkResources, separator, len == 0, "credits", addIcon)];
		
		pieceIDs.sort();
		for (var i:int = 0; i < len; i++) {
			var id:int = pieceIDs[i];
			var amount:int = cost.getPiece(id);
			var epd:EquipmentPieceData = AccountModel.instance.equipmentPieces.getByID(id);
			if (isEnabled) {
				costArr.push(paint(stringAddSeparator(amount),
						checkResources && epd.depotCount > amount ? ColorConstants.RED : ColorConstants.TEXT_ACCENTED)
				+ (addIcon ? epd.imageSubstitutionSubstring : ""));
			} else {
				costArr.push(paint(stringAddSeparator(amount),
						ColorConstants.TEXT_DISABLED) + addIcon ? epd.imageSubstitutionDisabledSubstring : "");
			}
		}
		return costArr.join(separator);
	}
	
}
