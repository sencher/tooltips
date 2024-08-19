package wowp.utils.data.binding 
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	public class BindingUtils 
	{
		public static function bind(site:BindableObject, host:BindableObject, mutual:Boolean = false):void
		{
			site.value = host.value;
			
			var b:BindingEntity = new BindingEntity(host, ObjectChangedEvent.TYPE,
				function(e:ObjectChangedEvent):void
				{
					site.value = host.value;
				}
			);
			
			if (mutual)
			{
				bind(host, site);
			}
		}
		
		public static function bindSetter(setter:Function, host:BindableObject):void
		{
			new BindingEntity(host, ObjectChangedEvent.TYPE,
				function(e:ObjectChangedEvent):void
				{
					switch (setter.length)
					{
						case 0:
							setter();
							break;
						case 1:
							setter(e.newValue);
							break;
						default:
							setter(e.oldValue, e.newValue);
							break;
					}
				} 
			);
		}
		
		
		public static function bindProperty(site:Object, prop:String, host:BindableObject):void
		{
			if (site.hasOwnProperty(prop))
			{
				site[prop] = host.value;	
			}
			
			new BindingEntity(host, ObjectChangedEvent.TYPE,
				function(e:ObjectChangedEvent):void
				{
					if (site.hasOwnProperty(prop))
					{
						site[prop] = host.value;
					}
				} 
			);
		}
		
		public static function bindEvent(site:BindableObject, dispatcher:IEventDispatcher, eventType:String, comProp:String):void
		{
			bindEventProp(site, "value", dispatcher, eventType, comProp);
		}
		
		public static function bindEventProp(site:Object, prop:String, dispatcher:IEventDispatcher, eventType:String, comProp:String):void
		{
			if (site.hasOwnProperty(prop))
			{
				var val:Object = dispatcher[comProp];
				if (site[prop] != val)
				{
					site[prop] = val;
				}
				
				new BindingEntity(dispatcher, eventType,
					function(e:Event):void {
						if (site[prop] != dispatcher[comProp])
						{
							site[prop] = dispatcher[comProp];
						}
					}
				);
			}
			else
			{
				trace("BindingUtils: cant find such property", prop, "in", site);
			}
		}
		
		public static function bindEventSetter(setter:Function, dispatcher:IEventDispatcher, eventType:String, comProp:String=null):void
		{
			new BindingEntity(dispatcher, eventType,
				function(e:Event):void {
					var source:Object = e.target;
					if (setter.length == 0 || comProp==null || comProp=="")
					{
						setter();
					}
					else
					{
						setter(source[comProp]);
					}
				}
			);
		}
		
		/**
		 * убирает все биндинги
		 */
		public static function dispose():void
		{
			trace("BindingUtils::dispose");
			BindingEntity.clear();
		}
	}
}
import flash.events.IEventDispatcher;
import flash.utils.getTimer;

class BindingEntity
{
	private static var _allBindings:Vector.<BindingEntity> = new Vector.<BindingEntity>();
	
	public var eventType:String;
	public var listener:Function;
	public var dispatcher:IEventDispatcher;
	
	public function BindingEntity(dispatcher:IEventDispatcher, eventType:String, listener:Function)
	{
		this.dispatcher = dispatcher;
		this.eventType = eventType;
		this.listener = listener;
		dispatcher.addEventListener(eventType, listener);
		_allBindings[_allBindings.length] = this;
	}
	
	public function dispose():void
	{
		dispatcher.removeEventListener(eventType, listener);
		listener = null;
		dispatcher = null;
	}
	
	public static function clear():void
	{
		trace("  There are", _allBindings.length, "BindingEntity's...");
		var t:int = getTimer();
		while (_allBindings.length > 0)
		{
			_allBindings.pop().dispose();
		}
		trace("  ...disposed in", int(getTimer() - t).toString(), "ms");
	}
}
