package wowp.utils.string.time
{
	
	public function getFormattedTime(i:int):Object {
		var d:int = i / 86400;
		var h:int = (i - d * 86400) / 3600;
		var m:int = (i - d * 86400 - h * 3600) / 60;
		var s:int = i - d * 86400 - h * 3600 - m * 60;
		return {d: d, h: h, m: m, s:s};
	}
	
}
