package wowp.utils.data.binding.presets 
{
	import flash.events.Event;
	import wowp.utils.data.binding.EventBinder;
	import wowp.utils.data.binding.core.IBindingModel;
	
	
	public class SelectBinder extends EventBinder
	{
		
		public function SelectBinder(model:IBindingModel) 
		{
			super(model, Event.SELECT, "selected");
		}
		
	}

}
