package utils.wg.utils.cost
{
	import wowp.account.constants.ColorConstants;
	import wowp.account.model.AccountModel;
	import wowp.account.model.player.ResourcesModel;
	import wowp.account.model.player.WalletState;
	import wowp.hangar.vo.CostVO;
	import wowp.utils.string.paint;
	import wowp.utils.string.stringAddSeparator;
	
	public function getCostString(cost:CostVO, isEnabled:Boolean = true, checkResources:Boolean = false,
                                  separator:String = ", ", showZero:Boolean = true, zeroCurrency:String = "credits",
                                  addIcon:Boolean = true):String
	{
		var resources:ResourcesModel = AccountModel.instance.resourcesModel;
		var costArr:Array = [];
		var currency:Object;
		if (!cost) cost = new CostVO();
		//	gold
		CostCurrencyMap.map[1]["notSynced"] = resources.walletModel.goldState != WalletState.SYNCRONIZED;
		
		for each (currency in CostCurrencyMap.map) {
			if (cost[currency.name] != 0 || cost.isNull && showZero && zeroCurrency == currency.name) {
				costArr.push(
						paint(
								stringAddSeparator(cost[currency.name]),
								checkResources && currency.resourcesName && cost[currency.name] > resources[currency.resourcesName] ?
										ColorConstants.RED :
										isEnabled ?
												currency.color :
												currency.colorDisabled
						)
						+ (addIcon ?
								((isEnabled ?
										(currency.notSynced ?
												currency.iconNotSynced
												: currency.icon)
										: currency.iconDisabled))
								: "")
				);
			}
		}
		
		return costArr.join(separator);
	}
	
}