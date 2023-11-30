package utils.wg.string
{
	/**
	 * Возвращает оставшееся время в виде таймера: 6д. 18:52:03
	 * @param seconds оставшееся время в секундах
	 * @return
	 */
	public function getTimerString(seconds:Number):String
	{
		return getTimeString(seconds, " " + loc("COUNTER_DAYS") + " ", ":", ":", "");
	}
}