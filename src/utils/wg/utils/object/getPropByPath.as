package utils.wg.utils.object
{
	public function getPropByPath(source:Object, path:String):* {
		var obj:Object = source;
		var key:String;
		var args:Array;
		
		if (!path) return null;
		if (!obj) return null;
		
		args = path.split(".");
		
		for each (key in args) {
			if (obj.hasOwnProperty(key)) {
				obj = obj[key];
			} else {
				return null;
			}
		}
		return obj;
	}
}
