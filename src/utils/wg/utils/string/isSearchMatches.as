package utils.wg.utils.string
{
	import wowp.utils.Utils;
	
	public function isSearchMatches(searchStr:String, targetStr:String):Boolean {
		var regExp:RegExp = new RegExp("[ \\-.,]+", "ig");
		var valueArr:Array = Utils.trimWhitespace(searchStr).split(regExp);
		var altName:String;
		var transName:String;
		var matches:Boolean = true;
		var prevIndex:int = -1;
		var currentIndex:int;
		
		altName = targetStr.replace(regExp, "").toUpperCase();
		altName = stringReplace(altName, "Ё", "Е");
		transName = Transliteration.convert(altName);
		
		for each (var sub:String in valueArr) {
			sub = stringReplace(sub.toUpperCase(), "Ё", "Е");
			currentIndex = altName.indexOf(sub);
			if (currentIndex < 0) {
				currentIndex = transName.indexOf(sub);
			}
			if (currentIndex > -1 && currentIndex > prevIndex) {
				currentIndex = prevIndex;
			} else {
				matches = false;
				break;
			}
		}
		return matches;
	}
}
