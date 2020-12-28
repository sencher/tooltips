package utils.wg.utils.data.binding
{
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;
	
	public class BindableObject extends EventDispatcher
	{
		protected static const _all:Vector.<BindableObject> = new Vector.<BindableObject>(); 
		
		private var _callbacks:Array = [];
		protected var _value:Object;
		
		public function get value():Object
		{
			return _value;
		}
		
		public function BindableObject(value:Object = null)
		{
			_value = value;
			_all[_all.length] = this;
		}
		
		public function set value(object:Object):void
		{
			if (_value != object)
			{
				var oldValue:Object = _value;
				_value = object;
				dispatchEvent(new ObjectChangedEvent(oldValue, _value));
				
				var len:int = _callbacks.length;
				if (len > 0)
				{
					var i:int = 0;
					while (i < len)
					{
						var callback:Function = _callbacks[i] as Function;
						if (callback == null)
						{
							_callbacks.splice(i, 1);
							--len;
						}
						else
						{
							++i;
							switch (callback.length)
							{
								case 0:
									callback();
									break;
								case 1:
									callback(_value);
									break;
								default:
									callback(oldValue, _value);
									break;
							}
						}
					}
				}
			}
		}
		
		public function dispatch():void
		{
			dispatchEvent(new ObjectChangedEvent(_value, _value));
		}
		
		public function addCallback(callback:Function):void
		{
			if (_callbacks.indexOf(callback) == -1)
			{
				_callbacks[_callbacks.length] = callback;
			}
		}
		
		public function removeCallback(callback:Function):void
		{
			var index:int = _callbacks.indexOf(callback);
			if (index != -1)
			{
				_callbacks[index] = null;
			}
		}
		
		public function unbindAll():void
		{
			_callbacks.length = 0;
			_value = null;
		}
		
		public static function dispose():void
		{
			trace("BindableObject::dispose");
			trace("  There are", _all.length, "bindable objects...");
			var t:int = getTimer();
			while (_all.length > 0)
			{
				_all.pop().unbindAll();
			}
			trace("  ... disposed in", int(getTimer() - t).toString(), "ms");
		}
	}

}