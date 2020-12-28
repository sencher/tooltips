package utils.wg.utils.string
{

	public function stringReplaceBatch(text:String, replace:Object):String {
		if (text == null)return null;
		if (replace == null)return text;
		for (var s:String in replace) {
			text = stringReplace(text, "{" + s + "}", replace[s]);
			text = stringReplace(text, "{" + s.toUpperCase() + "}", replace[s]);
		}
		return text;
	}
	
}
