package utils.wg.utils.display.cache
{
	
	
	public interface ICacheClient 
	{
		function onResourceLoaded(resource:Object):void;
		function onError():void;
	}
	
}