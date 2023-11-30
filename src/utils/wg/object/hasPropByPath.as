package utils.wg.object
{
	public function hasPropByPath(source:Object, path:String):Boolean {
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
				return false;
			}
		}
		return true;
	}
}
