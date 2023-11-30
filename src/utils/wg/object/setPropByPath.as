package utils.wg.object
{
	public function setPropByPath(source:Object, path:String, value:Object):void {
		var obj:Object = source;
		var key:String;
		var args:Array;
		var prop:String;
		
		if (!path) return;
		if (!obj) return;
		
		args = path.split(".");
		prop = args.pop();
		
		for each (key in args) {
			if (!obj.hasOwnProperty(key)) {
				obj[key] = {};
			}
			obj = obj[key];
		}
		obj[prop] = value;
	}
}
