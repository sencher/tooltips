package utils.wg.utils.data.binding
{
	import flash.events.Event;
	
	
	internal class ObjectChangedEvent extends Event 
	{
		internal static const TYPE:String = "objectChanged";
		
		public var oldValue:Object;
		public var newValue:Object;
		
		public function ObjectChangedEvent(oldValue:Object, newValue:Object) 
		{
			this.oldValue = oldValue;
			this.newValue = newValue;
			super(TYPE, true, true);
		}
	}

}