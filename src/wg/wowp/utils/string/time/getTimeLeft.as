package wowp.utils.string.time
{
	import wowp.utils.string.loc;
	import wowp.utils.string.nbsp;
	
	public function getTimeLeft(time:int):String {
		var o:Object = getFormattedTime(time);
		var str:String = "";
		if (o.d != 0) {
			str += o.d + nbsp() + loc("COUNTER_DAYS") + nbsp();
		}
		str += int2String(o.h) + ":" + int2String(o.m) + ":" + int2String(o.s);
		return str;
	}
	
}
