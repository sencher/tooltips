package utils.wg.utils.data
{
	
	public function getByPath(object:Object, ...path:Array):Object {
		var len:int = path.length;
		var obj:Object = object;
		for (var i:int = 0; i < len; i++) {
			obj = obj[path[i]];
			if (obj == null) return null;
		}
		return obj;
	}
	
}
