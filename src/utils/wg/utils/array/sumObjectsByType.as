package utils.wg.utils.array
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	import wowp.utils.data.ioc.UnitInjector;
	import wowp.utils.object.deepCopy;
	import wowp.utils.object.getPropByPath;
	import wowp.utils.object.setPropByPath;
	
	/**
	 * суммирует значения полей value двух массивов по полю field
	 * @param    obj    -    первый обьект
	 * @param    obj2    -    второй обьект
	 * @param    field    -    поле
	 * @param    value    -    знечение
	 * @return
	 *
	 * Пример:
	 * Obj1: [{id:null, type:"tickets", value:10}, {id:null, type:"freeXP", value:200}]
	 * Obj2: [{id:null, type:"tickets", value:2},  {id:8, type:"consumable", value:1}]
	 *
	 * sumObjectsByType(Obj1, Obj2, "type", "value")
	 *
	 * Результат:
	 * [{id:null, type:"tickets", value:12}, {id:null, type:"freeXP", value:200}, {id:8, type:"consumable", value:1}]
	 */
	public function sumObjectsByType(source:Array, fields:Array, value:String, skipArray:Array = null):Array
	{
		var result:Array = [];
		var item:Object;
		var newItem:Object;
		var className:String;
		
		for each(item in source) {
			var listIndex:int = -1;
			loop: for (var j:int = 0; j < result.length; j++) {
				
				for each (var field:String in fields) {
					if (result[j][field] != item[field]) {
						continue loop;
					}
				}
				
				//	check for skip
				if (skipArray && skipArray.length > 0) {
					objectSkipLoop: for each (var skipObject:Object in skipArray) {
						for (var prop:String in skipObject) {
							if (!item.hasOwnProperty(prop) || item[prop] != skipObject[prop]) {
								continue objectSkipLoop;
							}
						}
						continue loop;
					}
				}
				
				
				if (Number(getPropByPath(result[j], value)) > 0 && Number(getPropByPath(item, value)) > 0) {
					listIndex = j;
					if (getPropByPath(result[j], value) is String) {
						setPropByPath(
								result[j],
								value,
								(Number(getPropByPath(result[j], value)) + Number(getPropByPath(item, value))).toString()
						);
					}
					else {
						setPropByPath(
								result[j],
								value,
								(Number(getPropByPath(result[j], value)) + Number(getPropByPath(item, value)))
						);
					}
				}
			}
			if (listIndex == -1) {
				className = getQualifiedClassName(item);
				if (className == "Object") {
					newItem = deepCopy(item);
				}
				else {
					newItem = new (getDefinitionByName(className))();
					new UnitInjector(getDefinitionByName(className) as Class, item).inject(newItem);
				}
				result.push(newItem);
			}
		}
		return result;
	}
	
}