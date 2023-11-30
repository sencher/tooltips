package utils.wg.string.time
{
	import flash.external.ExternalInterface;
	
	/**
	 * форматирует время в соответствии с опциями из FormatTimeOptions
	 * @param	time
	 * @param	option
	 * @return
	 */
	public function formatTime(time:Number, option:String = "dmYHM"):String
	{
		return String(ExternalInterface.call("system.getTimeFormated", time, option));
	}

}