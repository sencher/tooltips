package wowp.utils.string
{
	
	public function URLAddParameter(url:String, param:String, value:String):String {
		if (url == null) return url;
		url = URLRemoveParameter(url, param);
		var arr:Array = url.split("?");
		if (arr.length == 1) return url + "?" + param + "=" + value;
		return url + "&" + param + "=" + value;
	}
	
}
