package utils.wg.array
{
	/**
	 * меняет местами ключи и значения
	 * @param	object
	 * @return
	 */
	public function invertObject(object:Object):Object
	{
		var newObj:Object = {};
		for (var s:String in object) {
			newObj[String(object[s])] = s;
		}
		return newObj;
	}

}