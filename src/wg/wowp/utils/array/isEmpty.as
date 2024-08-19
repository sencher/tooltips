package wowp.utils.array 
{
	/**
	 * проверяет, пустой ли обьект
	 * @param	iterable
	 * @return
	 */
	public function isEmpty(iterable:Object):Boolean
	{
		for each(var n:Object in iterable) return false;
		return true;
	}
}