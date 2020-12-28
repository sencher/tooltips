package utils.wg.utils.array
{
	
	/**
	 * возвращяет ключ под которым объект записан в объект
	 * @param	object
	 * @param	value
	 * @return
	 */
	public function getKey(object:Object, value:Object):String 
	{
		for (var s:String in object)
		{
			if (object[s] == value)
			{
				return s;
			}
		}
		return null;
	}


}