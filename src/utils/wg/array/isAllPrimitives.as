package utils.wg.array
{
	/**
	 * проверяет, все ли элементы массива принадлежат к примитивным типам
	 * @param	iterable
	 * @return
	 */
	public function isAllPrimitives(iterable:Object):Boolean
	{
		for each (var elem:Object in iterable)
		{
			if (elem == null	 ||
				elem is Boolean	 ||
				elem is String	 ||
				elem is Number	 ||
				elem is int		 ||
				elem is uint)
			{
				// primitive
			}
			else
			{
				return false;
			}
		}
		return true;
	}


}