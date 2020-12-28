package utils.wg.utils.cost
{
	import flash.text.TextField;
	
	import wowp.account.constants.ColorConstants;
	import wowp.account.model.AccountModel;
	import wowp.account.model.player.ResourcesModel;
	import wowp.account.model.player.WalletState;
	import wowp.hangar.vo.CostVO;
	import wowp.utils.display.text.substitution.setSubstitutions;
	import wowp.utils.string.*;
	
	/**
	 * Создает текст из перечня валют CostVO: <количество> <иконка>, <количество> <иконка> ...
	 * Если указан textField, устанавливает в него текст
	 *
	 * Примеры:
	 * 		CostString.init(deficitCostVO, txtCostDeficit).bigIcons.disabled.build;
	 * 		CostString.init(resourceCostVO, txtCost, 'Ресурсы в наличии: ' + CostString.PLACEHOLDER).build;
	 */
	public class CostString
	{
		public static const PLACEHOLDER:String = "{cost_string}";
		
		private var _colorDeficit:uint = ColorConstants.RED;
		
		private var _enabled:Boolean = true;
		private var _checkResources:Boolean = false;
		private var _showZero:Boolean = true;
		private var _zeroCurrency:String = "credits";
		private var _separator:String = ", ";
		private var _addIcon:Boolean = true;
		private var _bigIcons:Boolean = false;
		
		private var _cost:CostVO;
		private var _tf:TextField;
		private var _template:String;
		
		public static function init(cost:CostVO, tf:TextField=null, template:String=null):CostString {
			var cs:CostString = new CostString(cost, tf, template);
			return cs;
		}
		
		public function CostString(cost:CostVO, tf:TextField=null, template:String=null):void {
			_cost = cost;
			_tf = tf;
			_template = template;
		}
		
		public function get disabled():CostString {
			_enabled = false;
			return this;
		}
		
		public function get checkResources():CostString {
			_checkResources = true;
			return this;
		}
		
		public function get hideZero():CostString {
			_showZero = false;
			return this;
		}
		
		public function zeroCurrency(value:String):CostString {
			_zeroCurrency = value;
			return this;
		}
		
		public function separator(value:String):CostString {
			_separator = value;
			return this;
		}
		
		public function get hideIcon():CostString {
			_addIcon = false;
			return this;
		}
		
		public function get bigIcons():CostString {
			_bigIcons = true;
			return this;
		}
		
		public function get build():String {
			var resources:ResourcesModel = AccountModel.instance.resourcesModel;
			var costArr:Array = [];
			var currency:Object;
			var result:String;
			if (!_cost) _cost = new CostVO();
			//	gold
			CostCurrencyMap.map[1]["notSynced"] = resources.walletModel.goldState != WalletState.SYNCRONIZED;
			
			for each (currency in CostCurrencyMap.map) {
				if (_cost[currency.name] != 0 || _cost.isNull && _showZero && _zeroCurrency == currency.name) {
					costArr.push(
							paint(
									stringAddSeparator(_cost[currency.name]),
									checkResources && currency.resourcesName && _cost[currency.name] > resources[currency.resourcesName] ?
											_colorDeficit :
											_enabled ?
													currency.color :
													currency.colorDisabled
							)
							+ (_addIcon ?
							((_enabled ?
									(currency.notSynced ?
											currency.iconNotSynced
											: (_bigIcons && currency.bigIcon ?
													currency.bigIcon
													: currency.icon))
									: (_bigIcons && currency.bigIconDisabled ?
											currency.bigIconDisabled
											: currency.iconDisabled)))
							: "")
					);
				}
			}
			
			result = costArr.join(_separator);
			
			if (_tf) {
				if (_template) {
					_tf.htmlText = stringReplace(_template, PLACEHOLDER, result);
				} else {
					_tf.htmlText = result;
					
				}
				setSubstitutions(_tf);
			}
			
			return result;
		}
	}
}
