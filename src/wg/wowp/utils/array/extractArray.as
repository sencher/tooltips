package wowp.utils.array
{
	/**
	 * создает коллекцию из объектов, которые имеют проперти и значение из соответсвующих элементов collection
	 * соответствие задается мапой props, где ключ - проперти в новом объекте, значение - имя проперти в объекте исходной коллекции
	 * @param collection
	 * @param props
	 * @return
	 */
	public function extractArray(collection:Object, props:Object):Array {
		var result:Array = [];
		for each(var item:Object in collection) {
			var object:Object = {};
			for (var propName:String in props) {
				var newPropName:String = props[propName];
				object[propName] = item[newPropName];
			}
			result.push(object)
		}
		return result;
	}
	
}
