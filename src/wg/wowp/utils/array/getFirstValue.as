package wowp.utils.array 
{
	/**
	 * возвраящет первый попавшийся объект другого динамического объекта или массива
	 * @param	object
	 * @return
	 */
	public function getFirstValue(object:Object):Object 
	{
		for each(var obj:Object in object) return obj;
		return null;
	}
		
}