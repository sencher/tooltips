package wowp.utils.data.binding 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import wowp.utils.data.binding.core.Binder;
	import wowp.utils.data.binding.core.IBindingModel;
	
	public class EventBinder extends Binder
	{
		private var _event:String;	//	событие, на которое должен реагировать биндер
		private var _prop:String;	//	свойство, которое изменяется по событию
		
		
		public function EventBinder(model:IBindingModel, event:String, prop:String) 
		{
			super(model);
			_event = event;
			_prop = prop;
		}
		
		public final function add(component:EventDispatcher, dataID:String, commit:Boolean=true, onChange:Function=null):void
		{
			if (component == null)	return;		
			
			remove(component);
			
			var holder:EventVO = new EventVO();
			holder.component = component;
			holder.dataID = dataID;
			holder.onChange = onChange;
			_container[component] = holder;
			
			var currentValue:Object = getModelValue(dataID);
			setValue(component, _prop, currentValue);
			invokeSetter(onChange, currentValue);
		
			if (commit)
			{
				component.addEventListener(_event, eventHandler);
			}
		}
		
		public final function remove(component:EventDispatcher):void
		{
			if (component == null)	return;			
			
			var holder:EventVO = _container[component] as EventVO;
			if (holder != null)
			{
				_container[component] = null;
				delete _container[component];
			}
			
			component.removeEventListener(_event, eventHandler);
		}
		
		override protected function onDataChange(dataID:String, value:Object):void 
		{
			for each(var holder:EventVO in _container)
			{
				if (holder.dataID == dataID)
				{
					setValue(holder.component, _prop, value);
					invokeSetter(holder.onChange, value);
				}
			}
		}
		
		protected function eventHandler(e:Event):void
		{
			var holder:EventVO = _container[e.target];
			setModelValue(holder.dataID, holder.component[_prop]);
		}
	}
}

import flash.events.EventDispatcher;
class EventVO {
	public var component:EventDispatcher;
	public var dataID:String;
	public var onChange:Function;
}










