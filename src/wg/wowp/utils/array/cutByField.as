package wowp.utils.array 
{
	/**
	 * найти и вырезать первый объект в массиве array, в котором поле field равно value
	 * @param	array	-	массив в котором происходит масссив
	 * @param	field	- 	поле
	 * @param	value	- 	знечение поля
	 * @return
	 */
	public function cutByField(iterable:Object, field:String, value:Object):Object
	{
		for each(var obj:Object in iterable) {
			if (obj.hasOwnProperty(field) && obj[field] == value) {
				iterable.splice(iterable.indexOf(obj), 1);
				return obj;
			}
		}
		return null;
	}

}