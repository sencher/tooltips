package utils.wg.data.binding.core
{
	import flash.events.IEventDispatcher;
	
	public interface IBindingModel extends IEventDispatcher
	{
		function setData(dataID:String, value:Object):Boolean;
		function getData(dataID:String):Object;
	}
	
}