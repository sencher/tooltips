package utils.wg.data.binding.presets.clik
{
	import scaleform.clik.events.ListEvent;
	import wowp.utils.data.binding.core.IBindingModel;
	import wowp.utils.data.binding.EventBinder;
	
	
	public class IndexChangeBinder extends EventBinder
	{
		
		public function IndexChangeBinder(model:IBindingModel) 
		{
			super(model, ListEvent.INDEX_CHANGE, "selectedIndex");
		}
		
	}

}