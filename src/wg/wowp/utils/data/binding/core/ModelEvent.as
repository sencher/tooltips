package wowp.utils.data.binding.core 
{
	import flash.events.Event;
	
	public class ModelEvent extends Event
	{
		public static const DATA_CHANGED:String = "wowp.utils.data.binding.core.DATA_CHANGED";
		
		public var dataID:String;
		public var value:Object;
		
		public function ModelEvent(type:String, dataID:String, value:Object) 
		{
			this.dataID = dataID;
			this.value = value;
			super(type);
		}
		
	}

}