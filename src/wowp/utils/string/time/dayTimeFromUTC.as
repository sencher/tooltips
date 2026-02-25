package wowp.utils.string.time
{
	import wowp.utils.string.nbsp;
	
	public function dayTimeFromUTC(utc:int):String {
		var d:Date = new Date();
		d.time = utc * 1000;
		return getDayName(d.day) + nbsp() + int2String(d.hours) + ":" + int2String(d.minutes);
	}
	
}
