package utils.wg.utils.string.time
{
	public function getTimeObject(seconds:Number):Object
	{
		var result:Object = {};

		seconds = Math.abs(seconds);

		result.days = int(seconds / Seconds.IN_DAY);
		result.hours = int( seconds / Seconds.IN_HOUR) - result.days * 24;
		result.mins = int(( seconds - (result.days * Seconds.IN_DAY + result.hours * Seconds.IN_HOUR ) ) / Seconds.IN_MINUTE );
		result.secs = seconds % Seconds.IN_MINUTE;

		return result;
	}
}
