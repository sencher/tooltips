package utils.wg.display.cache
{
	
	
	public interface ICacheClient 
	{
		function onResourceLoaded(resource:Object):void;
		function onError():void;
	}
	
}