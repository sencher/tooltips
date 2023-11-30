package utils.wg.string.time
{
	import wowp.core.LocalizationManager;
	
	public function getTimeDMSString(seconds:Number, needDay:Boolean = true):String
	{
		var result:String;
		var time:Object = getTimeObject(seconds);
		var isFullDay:Boolean = (seconds % Seconds.IN_DAY) == 0;
		var isFullHours:Boolean = (seconds % Seconds.IN_HOUR) == 0;
		var isFullMins:Boolean = (seconds % Seconds.IN_MINUTE) == 0;
		var loc:Function = LocalizationManager.getInstance().textByLocalizationID;
		
		var daysS:String = time.days.toString() + " " + loc("COUNTER_DAYS");
		var hoursS:String = time.hours.toString() + " " + loc("COUNTER_HOURS");
		var minsS:String = time.mins.toString() + " " + loc("COUNTER_MINUTES");
		
		if (isFullDay && needDay) { return daysS }
		if (isFullHours) { return hoursS }
		if (isFullMins) { return minsS }
		
		result = (needDay ? daysS : "") + hoursS + minsS;
		
		return result;
	}
	
}
