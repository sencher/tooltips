package utils.wg.array
{
	/**
	 * возвращяет первый попавшийся ключ
	 * @param	object
	 * @return
	 */
	public function getFirstKey(object:Object):String 
	{
		for (var s:String in object) return s;
		return null;
	}

}