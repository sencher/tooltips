package utils.wg.utils.domain
{
	import flash.system.ApplicationDomain;

	public function createObject(name:String, domain:ApplicationDomain = null):Object
	{
		var instance:Object;
		try {
			instance = new (getDefinition(name) as Class)();
		} catch (e:Error) {
			trace("[ERROR] createObject: Cannot create instance: " + name);
			trace("[ERROR] createObject: stacktrace: " + e.getStackTrace());
		}
		return instance;
	}

}