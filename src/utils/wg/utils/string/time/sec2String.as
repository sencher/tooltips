package utils.wg.utils.string.time
{
	public function sec2String(value:int, separator:String = ":"):String {
		var res:String = "";
		var h:int = value / 3600;
		if (h != 0) {
			res += h.toString() + separator;
		}
		var m:int = (value - h * 3600) / 60;
		res += int2String(m) + separator;
		var s:int = value - h * 3600 - m * 60;
		res += int2String(s);
		return res;
	}
	
}
