package utils.wg.array
{
	
	/**
	 * безопасно удаляет value из массива или вектора array, в случае удачного удаления возвращяет true, если объекта небыло в коллекции, то возвращает false
	 * @param	array
	 * @param	value
	 * @return
	 */
	public function safeSplice(collection:Object, value:Object):Boolean 
	{
		//	массив или вектор
		if (collection is Array || collection is Vector.<*> || collection is Vector.<int> || collection is Vector.<uint> || collection is Vector.<Number>)
		{
			var index:int = collection.indexOf(value);
			if (index != -1)
			{
				collection.splice(index, 1);
				return true;
			}
			else
			{
				return false;
			}
		}
		//	объект
		var key:String = getKey(collection, value);
		if (key != null)
		{
			delete collection[key];
			return true;
		}
		return false;
	}


}