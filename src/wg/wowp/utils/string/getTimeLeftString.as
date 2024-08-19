package wowp.utils.string
{
    import wowp.utils.string.time.Seconds;

    public function getTimeLeftString(timeLeft:int, dString:String, hString:String, mString:String=""):String // timeLeft в секундах
	{
		timeLeft = Math.abs(timeLeft);

		var days:int = Math.floor(timeLeft / Seconds.IN_DAY);
		var hours:int = Math.floor(timeLeft / Seconds.IN_HOUR);
		var minutes:int = Math.floor(timeLeft / Seconds.IN_MINUTE);

		var leftTime:String;
		var left:String;

		if (mString && minutes < 59)
		{
			leftTime = mString;
			left = int(minutes + 1).toString();
		}
		else if (hString && hours < 23)
		{
			leftTime = hString;
			left = int(hours + 1).toString();
		}
        else
        {
            leftTime = dString;
            left = int(days + 1).toString();
        }

		return left + leftTime;
	}
}
