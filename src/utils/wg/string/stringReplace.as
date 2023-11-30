package utils.wg.string
{
	/**
	 * заменяет в строке string все последовательности символов pattern на replace
	 * @param    string
	 * @param    pattern
	 * @param    replace
	 * @return
	 */
	public function stringReplace(string:String, pattern:Object, replace:Object):String
	{
		if (string == null)return null;
		return string.split(pattern).join(replace);
	}
	
}