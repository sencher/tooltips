package utils.wg.debug
{
	
	public function o2s(obj:Object):String
	{
		var res:String = "";
		
		if (obj == null) {
			res = "null";
		} else if (typeof(obj) == "function") {
			res = "function()";
		}
		else if (typeof(obj) == "string" || typeof(obj) == "boolean" || typeof(obj) == "number" || typeof(obj) == "undefined" || typeof(obj) == "xml") {
			res = String(obj);
		}
		else if (obj is Array) {
			res += "[";
			for (var s:String in obj) {
				if (res.length > 1) res += ", ";
				res += o2s(obj[s]);
			}
			res += "]";
		}
		else {
			res += "{";
			for (s in obj) {
				if (res.length > 1) res += ", ";
				res += s + ":" + o2s(obj[s]);
			}
			res += "}";
		}
		
		return res;
	}
	
	
}