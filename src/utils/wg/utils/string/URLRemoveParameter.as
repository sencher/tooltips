package utils.wg.utils.string
{
	
	public function URLRemoveParameter(url:String, parameter:String):String {
		var arr:Array = url.split("?");
		if (arr.length == 1) return url;
		var params:Array = arr[1].split("&");
		parameter = parameter + "=";
		params = params.filter(function (p:String):Boolean {
			return p.indexOf(parameter) != 0
		});
		return arr[0] + "?" + params.join("&");
	}
	
}
