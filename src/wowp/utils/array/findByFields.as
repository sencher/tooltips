package wowp.utils.array 
{
	/**
	 * найти первый объект в массиве array, в котором поля-ключи равны значениям ключей
	 * @param	array	-	массив в котором происходит масссив
	 * @param	value	- 	знечение поля
	 * @return
	 */
	public function findByFields(iterable:Object, value:Object):Object
	{
		for each(var obj:Object in iterable) {
			var equals:Boolean = true;
			for (var key:String in value) {
				if (!obj.hasOwnProperty(key) || obj[key] != value[key]) {
					equals = false;
					break;
				}
			}
			if (equals) {
				return obj;
			}
		}
		return null;
	}

}