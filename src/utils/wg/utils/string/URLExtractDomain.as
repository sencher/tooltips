package utils.wg.utils.string
{
	
	public function URLExtractDomain(url:String):String {
		if (url == null) return null;
		return url.split("?")[0];
	}
	
}
