package utils.wg.string
{

import utils.wg.utils.string.*;
	import wowp.core.LocalizationManager;
	
	public function loc(key:String, replace:Object = null):String {
		var value:String;
		if (replace != null) {
			value = stringReplaceBatch(LocalizationManager.getInstance().textByLocalizationID(key), replace);
		} else {
			value = LocalizationManager.getInstance().textByLocalizationID(key);
		}
		value = processTypicalTags(value);
		return value;
	}
}