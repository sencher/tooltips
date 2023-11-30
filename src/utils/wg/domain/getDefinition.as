package utils.wg.domain
{
	import flash.display.LoaderInfo;
	import flash.system.ApplicationDomain;

	public function getDefinition(name:String, loaderInfo:LoaderInfo=null):Class
	{
		var domain:ApplicationDomain = ApplicationDomain.currentDomain;
		if (loaderInfo != null && loaderInfo.applicationDomain != null) domain = loaderInfo.applicationDomain;
		return domain.getDefinition(name) as Class;
	}
}
