package utils.wg.utils.data.binding.presets.clik
{
	import scaleform.clik.events.SliderEvent;
	import wowp.utils.data.binding.EventBinder;
	import wowp.utils.data.binding.core.IBindingModel;
	
	public class ValueChangedBinder extends EventBinder 
	{
		
		public function ValueChangedBinder(model:IBindingModel) 
		{
			super(model, SliderEvent.VALUE_CHANGE, "value");
		}
		
	}

}