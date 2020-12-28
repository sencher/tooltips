package utils.wg.utils.string
{
	import wowp.utils.string.time.getTimeObject;

	public function getTimeString(seconds:Number, dString:String, hString:String = null, mString:String = null, sString:String = null):String
	{
		var result:String = "";
		var time:Object = getTimeObject(seconds);
		
		var daysS:String = String( time.days );
		var hourS:String = ( time.hours < 10 ) ? "0" + time.hours : String( time.hours );
		var minS:String = ( time.mins < 10 ) ? "0" + time.mins : String( time.mins );
		var secS:String = ( time.secs < 10 ) ? "0" + time.secs : String( time.secs );
		
		if (dString != null && time.days > 0)
		{
			result += daysS + dString;
		}
		
		if (hString != null)
		{
			result += hourS + hString;
		}
		
		if (mString != null)
		{
			result += minS + mString;
		}
		
		if (sString != null)
		{
			result += secS + sString;
		}
		
		return result;
	}
}