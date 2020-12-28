package utils.wg.utils.object
{
	import flash.utils.getQualifiedClassName;
	
	public function deepCopy(source:Object):Object {
		if (!source) return null;
		
		var result:Object = {};
		for (var key:String in source) {
			if (getQualifiedClassName(source[key]) == "Object") {
				result[key] = deepCopy(source[key]);
			} else {
				result[key] = source[key];
			}
		}
		return result;
	}
}
